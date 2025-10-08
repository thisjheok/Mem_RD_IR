#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/MemoryLocation.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/LoopInfo.h"
// PostDominators.h 제거

// ★ New PM 플러그인 등록에 필요한 헤더
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

#include <unordered_map>
#include <vector>  // ★ 추가
#include <set> // ★ 추가

using namespace llvm;

namespace {

// ---- 포인터 키 정의: (정규화된 base, 상수 오프셋) ----
struct PtrKey {
  const Value *Base;
  int64_t Offset; // 상수 오프셋만 사용 (바이트 정밀 X, 패턴 구분용)

  bool operator==(const PtrKey &O) const {
    return Base == O.Base && Offset == O.Offset;
  }
};

struct PtrKeyHash {
  size_t operator()(const PtrKey &K) const noexcept {
    // Value* 해시 + 오프셋 해시 단순 결합
    return std::hash<const void*>()(K.Base) ^ (std::hash<int64_t>()(K.Offset) * 1315423911u);
  }
};

// GEP의 상수 인덱스만 합산해 대략적 오프셋을 만든다.
static int64_t getConstOffsetFromGEP(const GEPOperator *GEP) {
  int64_t off = 0;
  for (auto Idx = GEP->idx_begin(); Idx != GEP->idx_end(); ++Idx) {
    if (auto *CI = dyn_cast<ConstantInt>(Idx->get())) {
      off += CI->getSExtValue();
    } else {
      return 0; // 비상수 인덱스가 섞이면 보수적으로 0
    }
  }
  return off;
}

// stripPointerCasts() + (가능하면) GEP 상수오프셋을 흡수
static PtrKey normalizePtr(const Value *P) {
  if (!P) return {nullptr, 0};

  const Value *S = P->stripPointerCasts();
  int64_t Off = 0;

  if (auto *GEP = dyn_cast<GEPOperator>(S)) {
    const Value *Base0 = GEP->getPointerOperand()->stripPointerCasts();
    Off = getConstOffsetFromGEP(GEP);
    return {Base0, Off};
  }
  return {S, Off};
}

// ★ 합류 지점 감지: 여러 predecessor를 가진 블록
bool isMergeBlock(BasicBlock *BB, BasicBlock *BranchBlock) {
  int predCount = 0;
  for (auto *Pred : predecessors(BB)) {
    predCount++;
    if (predCount > 1) return true;
  }
  return false;
}

// ★ 분기 블록 수집: 중간 블록을 건너뛰고 실제 분기 블록들을 찾음
void collectLeafBranches(
    BasicBlock *BB,
    std::unordered_map<PtrKey, unsigned long long, PtrKeyHash> LastAccessNo,
    unsigned long long MemAccessNo,
    std::vector<BasicBlock*> &LeafBlocks,
    std::set<BasicBlock*> &Visited) {
  
  if (Visited.count(BB)) return;
  Visited.insert(BB);
  
  // 이 블록의 메모리 접근 개수 세기
  int memAccessCount = 0;
  bool hasConditionalBranch = false;
  
  for (auto &I : *BB) {
    if (isa<LoadInst>(&I) || isa<StoreInst>(&I) || isa<MemIntrinsic>(&I)) {
      memAccessCount++;
    }
    if (auto *BI = dyn_cast<BranchInst>(&I)) {
      if (BI->isConditional()) {
        hasConditionalBranch = true;
      }
    }
  }
  
  // ★ 조건 분기가 있고 메모리 접근이 적으면 (예: 1개 이하) 중간 블록으로 간주
  if (hasConditionalBranch && memAccessCount <= 1) {
    // 하위 분기들을 재귀적으로 탐색
    for (BasicBlock *Succ : successors(BB)) {
      collectLeafBranches(Succ, LastAccessNo, MemAccessNo, LeafBlocks, Visited);
    }
  } else {
    // 실제 코드가 있는 leaf 블록
    LeafBlocks.push_back(BB);
  }
}

void measureBranchPathRD(
    BasicBlock *BB,
    std::unordered_map<PtrKey, unsigned long long, PtrKeyHash> &LastAccessNo,
    unsigned long long &MemAccessNo,
    std::unordered_map<PtrKey, std::vector<unsigned long long>, PtrKeyHash> &AllRDs,
    std::set<BasicBlock*> &Visited,
    BasicBlock *StartBlock) {
  
  if (Visited.count(BB)) return;
  
  // ★ 합류 지점 감지: 여러 predecessor가 있고, StartBlock이 아니면 중단
  if (BB != StartBlock) {
    int predCount = 0;
    for (auto *Pred : predecessors(BB)) {
      predCount++;
      if (predCount > 1) {
        // 합류 지점 도달, 여기서 중단
        return;
      }
    }
  }
  
  Visited.insert(BB);
  
  for (auto &I : *BB) {
    const Value *Ptr = nullptr;
    if (auto *L = dyn_cast<LoadInst>(&I)) {
      Ptr = L->getPointerOperand();
    } else if (auto *S = dyn_cast<StoreInst>(&I)) {
      Ptr = S->getPointerOperand();
    } else if (auto *MI = dyn_cast<MemIntrinsic>(&I)) {
      if (auto *MT = dyn_cast<MemTransferInst>(MI)) {
        Ptr = MT->getDest();
      } else if (auto *MS = dyn_cast<MemSetInst>(MI)) {
        Ptr = MS->getDest();
      }
    }
    
    if (!Ptr) continue;
    
    unsigned long long CurNo = MemAccessNo++;
    PtrKey Key = normalizePtr(Ptr);
    
    auto It = LastAccessNo.find(Key);
    if (It != LastAccessNo.end()) {
      unsigned long long RD = (CurNo > It->second) ? (CurNo - It->second) : 0ULL;
      AllRDs[Key].push_back(RD);  // ★ 모든 RD를 기록 (덮어쓰지 않음)
    }
    
    LastAccessNo[Key] = CurNo;
  }
  
  // ★ 후속 블록들을 재귀적으로 탐색
  auto *Term = BB->getTerminator();
  for (BasicBlock *Succ : successors(BB)) {
    measureBranchPathRD(Succ, LastAccessNo, MemAccessNo, AllRDs, Visited, StartBlock);
  }
}

struct ReusePass : public PassInfoMixin<ReusePass> {
  
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM) {
    // ★ LoopAnalysis 제거
    
    std::unordered_map<PtrKey, unsigned long long, PtrKeyHash> LastAccessNo;
    unsigned long long MemAccessNo = 0;
    std::set<BasicBlock*> ProcessedBlocks;
    
    // ★ 블록 순서 저장 (루프 감지용)
    std::unordered_map<BasicBlock*, int> BlockOrder;
    int order = 0;
    for (auto &BB : F) {
      BlockOrder[&BB] = order++;
    }

    for (auto &BB : F) {
      if (ProcessedBlocks.count(&BB)) continue;
      
      for (auto &I : BB) {
        // ★ 분기 명령어 감지
        if (auto *BI = dyn_cast<BranchInst>(&I)) {
          if (BI->isConditional() && BI->getNumSuccessors() >= 2) {
            
            // ★ 루프인지 확인: predecessor 중 하나가 현재 블록보다 뒤에 있으면 루프 (back-edge)
            bool isLoop = false;
            int currentOrder = BlockOrder[&BB];
            for (auto *Pred : predecessors(&BB)) {
              if (BlockOrder[Pred] > currentOrder) {
                // Back-edge 발견 = 루프 헤더
                isLoop = true;
                break;
              }
            }
            
            if (isLoop) {
              // 루프는 분기 처리 안 함
              continue;
            }
            
            // ★ if/else 분기만 처리
            // ★ 실제 분기 블록들 수집
            std::vector<BasicBlock*> LeafBlocks;
            std::set<BasicBlock*> CollectVisited;
            
            for (unsigned i = 0; i < BI->getNumSuccessors(); ++i) {
              BasicBlock *SuccBB = BI->getSuccessor(i);
              collectLeafBranches(SuccBB, LastAccessNo, MemAccessNo, LeafBlocks, CollectVisited);
            }
            
            // ★ 수집 과정에서 방문한 모든 블록을 처리됨으로 표시
            ProcessedBlocks.insert(CollectVisited.begin(), CollectVisited.end());
            
            // ★ leaf 블록들도 처리됨으로 표시
            for (auto *LB : LeafBlocks) {
              ProcessedBlocks.insert(LB);
            }
            
            // ★ 수집된 leaf 블록들 각각 측정
            std::vector<std::unordered_map<PtrKey, std::vector<unsigned long long>, PtrKeyHash>> BranchRDsAll;
            
            for (BasicBlock *LeafBB : LeafBlocks) {
              auto BranchLastAccess = LastAccessNo;
              unsigned long long BranchMemAccessNo = MemAccessNo;
              std::unordered_map<PtrKey, std::vector<unsigned long long>, PtrKeyHash> BranchAllRDs;
              std::set<BasicBlock*> Visited;
              
              measureBranchPathRD(LeafBB, BranchLastAccess, BranchMemAccessNo, 
                                 BranchAllRDs, Visited, nullptr);
              
              if (!BranchAllRDs.empty()) {
                BranchRDsAll.push_back(BranchAllRDs);
              }
            }
            
            // ★ 각 메모리 주소별로 분기 평균 RD 계산
            std::unordered_map<PtrKey, std::vector<unsigned long long>, PtrKeyHash> RDsByKey;
            
            for (auto &BranchRDs : BranchRDsAll) {
              for (auto &[Key, RDList] : BranchRDs) {
                // ★ 각 분기에서 해당 메모리의 모든 RD를 합산
                if (!RDList.empty()) {
                  unsigned long long sumRD = 0;
                  for (auto rd : RDList) {
                    sumRD += rd;
                  }
                  RDsByKey[Key].push_back(sumRD);  // ← 합계를 저장
                }
              }
            }
            
            // ★ 평균 RD 출력
            for (auto &[Key, RDs] : RDsByKey) {
              if (!RDs.empty()) {
                unsigned long long Sum = 0;
                for (auto rd : RDs) Sum += rd;
                double AvgRD = (double)Sum / RDs.size();
                
                if (DILocation *Loc = I.getDebugLoc()) {
                  errs() << F.getName() << ":" << Loc->getFilename() << ":" << Loc->getLine();
                } else {
                  errs() << F.getName() << ":<ir>";
                }
                errs() << "  Branch-Avg-RD=" << AvgRD
                       << "  base=" << Key.Base
                       << "  off=" << Key.Offset
                       << "  num_branches=" << RDs.size()
                       << "\n";
              }
            }
            continue;  // 분기 처리 후 다음 명령어로
          }
        }
        
        // ★ 일반 메모리 접근 처리 (기존 로직)
        const Value *Ptr = nullptr;
        if (auto *L = dyn_cast<LoadInst>(&I)) {
          Ptr = L->getPointerOperand();
        } else if (auto *S = dyn_cast<StoreInst>(&I)) {
          Ptr = S->getPointerOperand();
        } else if (auto *MI = dyn_cast<MemIntrinsic>(&I)) {
          if (auto *MT = dyn_cast<MemTransferInst>(MI)) {
            Ptr = MT->getDest();
          } else if (auto *MS = dyn_cast<MemSetInst>(MI)) {
            Ptr = MS->getDest();
          }
        }

        if (!Ptr) continue;

        unsigned long long CurNo = MemAccessNo++;
        PtrKey Key = normalizePtr(Ptr);

        auto It = LastAccessNo.find(Key);
        if (It != LastAccessNo.end()) {
          unsigned long long RD = (CurNo > It->second) ? (CurNo - It->second) : 0ULL;

          if (DILocation *Loc = I.getDebugLoc()) {
            errs() << F.getName() << ":" << Loc->getFilename() << ":" << Loc->getLine();
          } else {
            errs() << F.getName() << ":<ir>";
          }
          errs() << "  RD(mem-accesses)=" << RD
                 << "  base=" << Key.Base
                 << "  off=" << Key.Offset
                 << "\n";
        }

        LastAccessNo[Key] = CurNo;
      }
    }

    return PreservedAnalyses::all();
  }
  
};

} 

llvm::PassPluginLibraryInfo getReusePassPluginInfo() {
    return {
      LLVM_PLUGIN_API_VERSION,
      "ReusePass",
      LLVM_VERSION_STRING,
      [](PassBuilder &PB) {
        PB.registerPipelineParsingCallback(
          [](StringRef Name, FunctionPassManager &FPM,
             ArrayRef<PassBuilder::PipelineElement>) {
            if (Name == "reuse-pass") { FPM.addPass(ReusePass()); return true; }
            return false;
          });
      }
    };
  }

#ifndef LLVM_ATTRIBUTE_WEAK
#define LLVM_ATTRIBUTE_WEAK __attribute__((weak))
#endif
#ifndef LLVM_ATTRIBUTE_VISIBILITY_DEFAULT
#define LLVM_ATTRIBUTE_VISIBILITY_DEFAULT __attribute__((visibility("default")))
#endif

extern "C"
LLVM_ATTRIBUTE_WEAK LLVM_ATTRIBUTE_VISIBILITY_DEFAULT
::llvm::PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return getReusePassPluginInfo();
}
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
#include <climits> // INT_MAX
#include "llvm/Support/Format.h"

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

// ★ SCEV을 사용하여 GEP 오프셋 계산 (비상수 인덱스 지원)
static int64_t getOffsetFromGEP(const GEPOperator *GEP, ScalarEvolution *SE) {
  int64_t off = 0;
  
  for (auto Idx = GEP->idx_begin(); Idx != GEP->idx_end(); ++Idx) {
    const Value *IdxVal = Idx->get();
    
    // 먼저 상수인지 확인
    if (auto *CI = dyn_cast<ConstantInt>(IdxVal)) {
      off += CI->getSExtValue();
    } 
    // SCEV을 사용하여 비상수 인덱스 분석
    else if (SE) {
      const SCEV *IdxSCEV = SE->getSCEV(const_cast<Value*>(IdxVal));
      
      // SCEVConstant: 상수인 경우
      if (const SCEVConstant *C = dyn_cast<SCEVConstant>(IdxSCEV)) {
        off += C->getAPInt().getSExtValue();
      }
      // SCEVCastExpr: 타입 캐스트 (sext, zext 등) - 내부 피연산자 분석
      else if (const SCEVCastExpr *Cast = dyn_cast<SCEVCastExpr>(IdxSCEV)) {
        const SCEV *InnerSCEV = Cast->getOperand();
        
        // 캐스트 내부가 AddRecExpr인지 확인
        if (const SCEVAddRecExpr *AR = dyn_cast<SCEVAddRecExpr>(InnerSCEV)) {
          const SCEV *Start = AR->getStart();
          if (const SCEVConstant *StartConst = dyn_cast<SCEVConstant>(Start)) {
            off += StartConst->getAPInt().getSExtValue();
          }
          // Start가 0이면 off += 0 (암묵적)
        }
        // 캐스트 내부가 AddExpr인지 확인
        else if (const SCEVAddExpr *Add = dyn_cast<SCEVAddExpr>(InnerSCEV)) {
          for (unsigned i = 0; i < Add->getNumOperands(); ++i) {
            if (const SCEVConstant *C = dyn_cast<SCEVConstant>(Add->getOperand(i))) {
              off += C->getAPInt().getSExtValue();
            }
          }
        }
        // 캐스트 내부가 상수인지 확인
        else if (const SCEVConstant *C = dyn_cast<SCEVConstant>(InnerSCEV)) {
          off += C->getAPInt().getSExtValue();
        }
        // 그 외는 0 기여 (단순 변수)
      }
      // SCEVAddRecExpr: 루프 내에서 변화하는 값 (예: i)
      // {Start,+,Step} 형태에서 Start만 오프셋에 기여
      else if (const SCEVAddRecExpr *AR = dyn_cast<SCEVAddRecExpr>(IdxSCEV)) {
        const SCEV *Start = AR->getStart();
        if (const SCEVConstant *StartConst = dyn_cast<SCEVConstant>(Start)) {
          off += StartConst->getAPInt().getSExtValue();
        }
        // Start가 상수가 아니거나 0이면 0 기여
      }
      // SCEVAddExpr: 덧셈 표현식 (예: i + 1)
      else if (const SCEVAddExpr *Add = dyn_cast<SCEVAddExpr>(IdxSCEV)) {
        // 상수 부분만 추출하여 합산
        for (unsigned i = 0; i < Add->getNumOperands(); ++i) {
          if (const SCEVConstant *C = dyn_cast<SCEVConstant>(Add->getOperand(i))) {
            off += C->getAPInt().getSExtValue();
          }
        }
      }
      // SCEVUnknown: 알 수 없는 값 (0으로 처리)
      else if (isa<SCEVUnknown>(IdxSCEV)) {
        // 단순 변수는 베이스 오프셋에 기여하지 않음 (0)
      }
      // 그 외: 0으로 처리 (같은 베이스로 간주)
      else {
        // 복잡한 SCEV은 베이스 오프셋에 기여하지 않음
      }
    }
    else {
      // SE가 없으면 단순히 포인터 해시 사용
      off += (int64_t)std::hash<const Value*>()(IdxVal) % 1000000;
    }
  }
  return off;
}

// stripPointerCasts() + (가능하면) GEP 오프셋을 흡수
static PtrKey normalizePtr(const Value *P, ScalarEvolution *SE = nullptr) {
  if (!P) return {nullptr, 0};

  const Value *S = P->stripPointerCasts();
  int64_t Off = 0;

  if (auto *GEP = dyn_cast<GEPOperator>(S)) {
    const Value *Base0 = GEP->getPointerOperand()->stripPointerCasts();
    Off = getOffsetFromGEP(GEP, SE);
    return {Base0, Off};
  }
  return {S, Off};
}

// ---- 루프 분석을 위한 자료구조 ----

// 반복 내 메모리 접근 정보
struct MemAccessInLoop {
  Instruction *Inst;
  PtrKey Key;
  unsigned Position;  // 반복 내 위치 (0-based)
  DILocation *DebugLoc;
};

// 루프 정보
struct LoopInfo {
  BasicBlock *Header;
  BasicBlock *Latch;
  std::vector<BasicBlock*> Blocks;
  unsigned long long TripCount;
  bool HasConstantTripCount;
};

// Trip count를 IR에서 직접 추출
static unsigned long long extractTripCount(BasicBlock *Header) {
  // 헤더의 마지막 명령어 (조건 분기) 확인
  auto *BI = dyn_cast<BranchInst>(Header->getTerminator());
  if (!BI || !BI->isConditional()) return 0;
  
  // 조건: icmp 명령어 찾기
  auto *Cmp = dyn_cast<ICmpInst>(BI->getCondition());
  if (!Cmp) return 0;
  
  // icmp slt %i, N 같은 패턴
  Value *Op0 = Cmp->getOperand(0);
  Value *Op1 = Cmp->getOperand(1);
  
  // 상수 찾기
  ConstantInt *Limit = nullptr;
  if (auto *C = dyn_cast<ConstantInt>(Op1)) {
    Limit = C;
  } else if (auto *C = dyn_cast<ConstantInt>(Op0)) {
    Limit = C;
  }
  
  if (!Limit) return 0;
  
  // icmp의 predicate에 따라 trip count 계산
  auto Pred = Cmp->getPredicate();
  unsigned long long N = Limit->getZExtValue();
  
  switch (Pred) {
    case ICmpInst::ICMP_SLT:  // i < N
    case ICmpInst::ICMP_ULT:
      return N;
    case ICmpInst::ICMP_SLE:  // i <= N
    case ICmpInst::ICMP_ULE:
      return N + 1;
    case ICmpInst::ICMP_EQ:   // i == N (루프 탈출 조건)
      return N;
    case ICmpInst::ICMP_NE:   // i != N (루프 계속 조건)
      return N;
    case ICmpInst::ICMP_SGT:  // i > N (역순)
    case ICmpInst::ICMP_UGT:
      return N;
    case ICmpInst::ICMP_SGE:  // i >= N
    case ICmpInst::ICMP_UGE:
      return N + 1;
    default:
      return 0;
  }
}

// 루프 블록들 수집
static void collectLoopBlocks(BasicBlock *Header, 
                              std::set<BasicBlock*> &LoopBlocks,
                              const std::unordered_map<BasicBlock*, int> &BlockOrder) {
  std::set<BasicBlock*> Visited;
  std::vector<BasicBlock*> Worklist;
  Worklist.push_back(Header);
  LoopBlocks.insert(Header);
  
  int HeaderOrder = BlockOrder.at(Header);
  
  // Back-edge를 가진 블록(latch) 찾기
  BasicBlock *Latch = nullptr;
  for (auto *Pred : predecessors(Header)) {
    if (BlockOrder.at(Pred) > HeaderOrder) {
      Latch = Pred;
      break;
    }
  }
  
  while (!Worklist.empty()) {
    BasicBlock *BB = Worklist.back();
    Worklist.pop_back();
    
    if (Visited.count(BB)) continue;
    Visited.insert(BB);
    
    for (BasicBlock *Succ : successors(BB)) {
      // Back-edge는 제외 (Header로 돌아가는 엣지)
      if (Succ == Header) continue;
      
      // 루프 내부 블록만 추가: Header 이후 && Latch 이전(또는 Latch 자신)
      int SuccOrder = BlockOrder.at(Succ);
      int LatchOrder = Latch ? BlockOrder.at(Latch) : INT_MAX;
      
      if (SuccOrder > HeaderOrder && SuccOrder <= LatchOrder && !LoopBlocks.count(Succ)) {
        LoopBlocks.insert(Succ);
        Worklist.push_back(Succ);
      }
    }
  }
}

// 반복 내 메모리 접근 시퀀스 구축
static std::vector<MemAccessInLoop> buildIterationSequence(
    const std::set<BasicBlock*> &LoopBlocks, ScalarEvolution *SE) {
  
  std::vector<MemAccessInLoop> Sequence;
  unsigned Position = 0;
  
  // 루프 블록들을 순서대로 순회 (간단히 set 순서 사용)
  for (BasicBlock *BB : LoopBlocks) {
    for (Instruction &I : *BB) {
      const Value *Ptr = nullptr;
      
      if (auto *LI = dyn_cast<LoadInst>(&I)) {
        Ptr = LI->getPointerOperand();
      } else if (auto *SI = dyn_cast<StoreInst>(&I)) {
        Ptr = SI->getPointerOperand();
      } else if (auto *MI = dyn_cast<MemIntrinsic>(&I)) {
        if (auto *MT = dyn_cast<MemTransferInst>(MI))
          Ptr = MT->getDest();
        else if (auto *MS = dyn_cast<MemSetInst>(MI))
          Ptr = MS->getDest();
      }
      
      if (!Ptr) continue;
      
      PtrKey Key = normalizePtr(Ptr, SE);
      Sequence.push_back({
        &I,
        Key,
        Position++,
        I.getDebugLoc()
      });
    }
  }
  
  return Sequence;
}

// 재사용 패턴 출력
static void printLoopRD(StringRef FuncName, 
                       const PtrKey &Key,
                       unsigned long long RD,
                       const char *Type,
                       unsigned Occurrences,
                       unsigned long long TripCount,
                       DILocation *Loc) {
  if (Loc) {
    errs() << FuncName << ":" << Loc->getFilename() << ":" << Loc->getLine();
  } else {
    errs() << FuncName << ":<ir>";
  }
  
  errs() << "  RD=" << RD
         << "  type=" << Type
         << "  occurrences=" << Occurrences
         << "  trip_count=" << TripCount
         << "  base=" << Key.Base
         << "  off=" << Key.Offset
         << "\n";
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
    BasicBlock *StartBlock,
    ScalarEvolution *SE) {
  
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
    PtrKey Key = normalizePtr(Ptr, SE);
    
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
    measureBranchPathRD(Succ, LastAccessNo, MemAccessNo, AllRDs, Visited, StartBlock, SE);
  }
}

struct ReusePass : public PassInfoMixin<ReusePass> {
  
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM) {
    
    // ★ ScalarEvolution 분석 가져오기
    ScalarEvolution *SE = &AM.getResult<ScalarEvolutionAnalysis>(F);
    
    std::unordered_map<PtrKey, unsigned long long, PtrKeyHash> LastAccessNo;
    unsigned long long MemAccessNo = 0;
    std::set<BasicBlock*> ProcessedBlocks;
    
    // 블록 순서 저장 (루프 감지용)
    std::unordered_map<BasicBlock*, int> BlockOrder;
    int order = 0;
    for (auto &BB : F) {
      BlockOrder[&BB] = order++;
    }

    // 루프 처리된 블록들 추적
    std::set<BasicBlock*> ProcessedLoops;
    
    for (auto &BB : F) {
      if (ProcessedBlocks.count(&BB)) continue;
      
      // 루프 헤더 감지 및 처리
      bool isLoopHeader = false;
      for (auto *Pred : predecessors(&BB)) {
        if (BlockOrder[Pred] >= BlockOrder[&BB]) {
          // Back-edge 발견 = 루프 헤더 (self-loop 포함)
          isLoopHeader = true;
          break;
        }
      }
      
      if (isLoopHeader && !ProcessedLoops.count(&BB)) {
        ProcessedLoops.insert(&BB);
        
        // 1. Trip count 추출
        unsigned long long TripCount = extractTripCount(&BB);
        
        if (TripCount > 0) {
          // 2. 루프 블록들 수집
          std::set<BasicBlock*> LoopBlocks;
          collectLoopBlocks(&BB, LoopBlocks, BlockOrder);
          
          // 3. 반복 내 메모리 접근 시퀀스 구축
          auto IterSeq = buildIterationSequence(LoopBlocks, SE);
          
          if (!IterSeq.empty()) {
            unsigned IterSize = IterSeq.size();
            
            // 4. 각 주소별 위치 수집
            std::unordered_map<PtrKey, std::vector<unsigned>, PtrKeyHash> PosMap;
            for (const auto &MA : IterSeq) {
              PosMap[MA.Key].push_back(MA.Position);
            }
            
            // 5. 재사용 패턴 분석 및 출력
            for (const auto &[Key, Positions] : PosMap) {
              // Intra-iteration 재사용
              if (Positions.size() > 1) {
                for (size_t i = 1; i < Positions.size(); ++i) {
                  unsigned long long RD = Positions[i] - Positions[i-1];
                  printLoopRD(F.getName(), Key, RD, "intra-iter", 
                             (unsigned)TripCount, TripCount, 
                             IterSeq[Positions[i]].DebugLoc);
                }
              }
              
              // Loop-carried 재사용 (마지막 → 첫 번째)
              if (!Positions.empty() && TripCount > 1) {
                unsigned LastPos = Positions.back();
                unsigned FirstPos = Positions.front();
                
                // suffix = IterSize - LastPos - 1
                unsigned Suffix = IterSize - LastPos - 1;
                // prefix = FirstPos + 1
                unsigned Prefix = FirstPos + 1;
                
                unsigned long long RD = Suffix + Prefix;
                
                printLoopRD(F.getName(), Key, RD, "loop-carried",
                           (unsigned)(TripCount - 1), TripCount,
                           IterSeq[FirstPos].DebugLoc);
              }
            }
            
            // 6. 글로벌 상태 업데이트
            unsigned long long LoopTotalAccesses = IterSize * TripCount;
            
            // 마지막 접근 갱신
            for (size_t i = 0; i < IterSeq.size(); ++i) {
              const auto &MA = IterSeq[i];
              unsigned long long LastOccurrence = MemAccessNo + (TripCount - 1) * IterSize + i;
              LastAccessNo[MA.Key] = LastOccurrence;
            }
            
            MemAccessNo += LoopTotalAccesses;
          }
          
          // 루프 블록들 스킵
          for (auto *LBB : LoopBlocks) {
            ProcessedBlocks.insert(LBB);
          }
        }
        
        continue;
      }
      
      for (auto &I : BB) {
        //  분기 명령어 감지
        if (auto *BI = dyn_cast<BranchInst>(&I)) {
          if (BI->isConditional() && BI->getNumSuccessors() >= 2) {
            
            // if/else 분기 처리
            std::vector<BasicBlock*> LeafBlocks;
            std::set<BasicBlock*> CollectVisited;
            
            for (unsigned i = 0; i < BI->getNumSuccessors(); ++i) {
              BasicBlock *SuccBB = BI->getSuccessor(i);
              collectLeafBranches(SuccBB, LastAccessNo, MemAccessNo, LeafBlocks, CollectVisited);
            }
            
            // 수집 과정에서 방문한 모든 블록을 처리됨으로 표시
            ProcessedBlocks.insert(CollectVisited.begin(), CollectVisited.end());
            
            // leaf 블록들도 처리됨으로 표시
            for (auto *LB : LeafBlocks) {
              ProcessedBlocks.insert(LB);
            }
            
            // 수집된 leaf 블록들 각각 측정
            std::vector<std::unordered_map<PtrKey, std::vector<unsigned long long>, PtrKeyHash>> BranchRDsAll;
            
            for (BasicBlock *LeafBB : LeafBlocks) {
              auto BranchLastAccess = LastAccessNo;
              unsigned long long BranchMemAccessNo = MemAccessNo;
              std::unordered_map<PtrKey, std::vector<unsigned long long>, PtrKeyHash> BranchAllRDs;
              std::set<BasicBlock*> Visited;
              
              measureBranchPathRD(LeafBB, BranchLastAccess, BranchMemAccessNo, 
                                 BranchAllRDs, Visited, nullptr, SE);
              
              if (!BranchAllRDs.empty()) {
                BranchRDsAll.push_back(BranchAllRDs);
              }
            }
            
            // 각 메모리 주소별로 분기 평균 RD 계산
            std::unordered_map<PtrKey, std::vector<unsigned long long>, PtrKeyHash> RDsByKey;
            
            for (auto &BranchRDs : BranchRDsAll) {
              for (auto &[Key, RDList] : BranchRDs) {
                //  각 분기에서 해당 메모리의 모든 RD를 합산
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
                errs() << "  Branch-Avg-RD=" << format("%.2f", AvgRD)  
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
        PtrKey Key = normalizePtr(Ptr, SE);

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
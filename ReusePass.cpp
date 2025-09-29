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

// ★ New PM 플러그인 등록에 필요한 헤더
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

#include <unordered_map>

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
// (정밀 바이트 오프셋이 필요하면 DataLayout로 타입 크기 반영해서 계산하세요)
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

struct ReusePass : public PassInfoMixin<ReusePass> {
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM) {
    // 필요하면 나중에 사용할 수 있는 분석들
    // auto &AA = AM.getResult<AAManager>(F);
    // auto &SE = AM.getResult<ScalarEvolutionAnalysis>(F);
    // auto &LI = AM.getResult<LoopAnalysis>(F);
    // (void)AA; (void)SE; (void)LI;

    // 마지막 접근 "IR 명령어 번호" 저장
    std::unordered_map<PtrKey, unsigned long long, PtrKeyHash> LastAccessNo;

    unsigned long long InstNo = 0; // 함수 전체에서 선형 증가 (모든 IR 명령마다 +1)

    for (auto &BB : F) {
      for (auto &I : BB) {
        unsigned long long CurNo = InstNo++; // ★ 모든 IR 명령어에서 증가 → "명령줄 수" 정의 만족

        const Value *Ptr = nullptr;
        if (auto *L = dyn_cast<LoadInst>(&I)) {
          Ptr = L->getPointerOperand();
        } else if (auto *S = dyn_cast<StoreInst>(&I)) {
          Ptr = S->getPointerOperand();
        } else if (auto *MI = dyn_cast<MemIntrinsic>(&I)) {
          if (auto *MT = dyn_cast<MemTransferInst>(MI)) {
            Ptr = MT->getDest(); // 필요하면 Src도 별도로 측정 가능
          } else if (auto *MS = dyn_cast<MemSetInst>(MI)) {
            Ptr = MS->getDest();
          }
        }

        if (!Ptr) continue;

        PtrKey Key = normalizePtr(Ptr);

        auto It = LastAccessNo.find(Key);
        if (It != LastAccessNo.end()) {
          unsigned long long RD = (CurNo > It->second) ? (CurNo - It->second - 1ULL) : 0ULL;

          if (DILocation *Loc = I.getDebugLoc()) {
            errs() << F.getName() << ":" << Loc->getFilename() << ":" << Loc->getLine();
          } else {
            errs() << F.getName() << ":<ir>";
          }
          errs() << "  RD(inst-lines)=" << RD
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

} // namespace

// ---- New PM 플러그인 등록 ----

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
cmake_minimum_required(VERSION 3.20)
project(ReusePass LANGUAGES C CXX)

# LLVM 찾기 (configure 시: cmake -DLLVM_DIR=$(llvm-config --cmakedir) ..)
find_package(LLVM REQUIRED CONFIG)
message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "LLVM_DIR: ${LLVM_DIR}")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# ⚠️ 숨김 플래그가 섞일 수 있으니 LLVM_DEFINITIONS는 넣지 않습니다.
include_directories(${LLVM_INCLUDE_DIRS})

# SHARED 권장 (MODULE일 때 dead-strip 이슈 피하기)
add_library(ReusePass SHARED ReusePass.cpp)

# 가시성: 기본(default)로 강제
set_target_properties(ReusePass PROPERTIES
  CXX_VISIBILITY_PRESET default
  VISIBILITY_INLINES_HIDDEN NO
  MACOSX_RPATH ON
)

# 🔒 심볼 확실히 내보내기 (macOS: 언더스코어 포함)
#  - export된 심볼이 있어야 opt가 플러그인으로 인식
set_target_properties(ReusePass PROPERTIES
  LINK_FLAGS "-Wl,-exported_symbol,_llvmGetPassPluginInfo"
)

# 링크 라이브러리
llvm_map_components_to_libnames(REQ_LLVM_LIBS
  Core IRReader Support Analysis TransformUtils
)
target_link_libraries(ReusePass PRIVATE ${REQ_LLVM_LIBS})

# (대안) 환경 따라 위 컴포넌트 매핑이 안 먹히면 아래 직접 이름 사용
# target_link_libraries(ReusePass PRIVATE
#   LLVMCore LLVMIRReader LLVMSupport LLVMAnalysis LLVMTransformUtils
# )

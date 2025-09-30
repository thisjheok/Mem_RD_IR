# 사용 방법

### 요구사항
- LLVM/Clang 설치 완료 (`llvm-config`, `clang`, `opt` 사용 가능)

---

### 1) 패스 빌드 (최초 1회)
```bash
# 프로젝트 루트로 이동
cd /Users/jangjaehyeok/Desktop/LLVM

# 깨끗한 빌드 폴더 생성
mkdir -p build && cd build

# LLVM 위치 지정 후 CMake 생성
cmake -DLLVM_DIR="$(llvm-config --cmakedir)" ..

# 빌드
cmake --build . -j
```

- 결과물: `build/libReusePass.dylib` (또는 환경에 따라 `build/ReusePass.so`)

---

### 2) C 파일 → LLVM IR(.ll) 생성
```bash
# 분석 대상 C 파일 지정 (절대경로 권장)
SRC=/absolute/path/to/your.c
IR_LL="$(basename "$SRC" .c).ll"

# 디버그 정보 포함 + optnone 해제 + O0로 텍스트 IR 생성
clang -O0 -Xclang -disable-O0-optnone -g -emit-llvm -S "$SRC" -o "$IR_LL"
```

---

### 3) (선택) IR 전처리로 정리
```bash
CANON_LL="$(basename "$SRC" .c)_canon.ll"

opt -passes='mem2reg,instcombine,simplifycfg,loop-simplify,indvars,sroa' \
    "$IR_LL" -o "$CANON_LL"
```

---

### 4) 패스 실행
- 전처리 없이 실행:
```bash
opt -load-pass-plugin "$(pwd)/libReusePass.dylib" \
    -passes='function(reuse-pass)' \
    test.ll -disable-output
```

- 전처리된 IR로 실행:
```bash
opt -load-pass-plugin "$(pwd)/libReusePass.dylib" \
    -passes='function(reuse-pass)' \
    "$CANON_LL" -disable-output
```

---

### 참고
- 위 명령은 `build` 디렉터리 안에서 실행하는 것을 권장합니다. `$(pwd)/libReusePass.dylib` 경로가 현재 디렉터리를 가리키기 때문입니다.
- `llvm-config` 경로가 다르면 `cmake -DLLVM_DIR=/path/to/llvm/cmake ..` 형태로 직접 지정하세요.
- 출력물을 파일로 저장하고 싶다면 `-disable-output`을 제거하거나 `-o out.ll`을 사용하세요.


FROM ubuntu:22.04

# 타임존 설정 (interactive 모드 방지)
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul

# 필수 패키지 설치
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    clang-15 \
    llvm-15 \
    llvm-15-dev \
    python3 \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# LLVM 도구 심볼릭 링크 생성
RUN ln -s /usr/bin/clang-15 /usr/bin/clang && \
    ln -s /usr/bin/llvm-config-15 /usr/bin/llvm-config && \
    ln -s /usr/bin/opt-15 /usr/bin/opt

# 작업 디렉토리 설정
WORKDIR /app

# 소스 코드 복사
COPY CMakeLists.txt ReusePass.cpp rd_analysis_auto.py README.md ./

# 빌드 디렉토리 생성 및 빌드
RUN mkdir -p build && cd build && \
    cmake -DLLVM_DIR=$(llvm-config --cmakedir) .. && \
    cmake --build . -j$(nproc)

# Python 스크립트를 위한 tasks 디렉토리 생성
RUN mkdir -p tasks

# 기본 작업 디렉토리를 build로 설정
WORKDIR /app/build

# 기본 명령어 설정 (컨테이너 실행 시 bash 시작)
CMD ["/bin/bash"]

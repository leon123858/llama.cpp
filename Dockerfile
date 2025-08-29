# 使用 Ubuntu 22.04 作為基礎映像
FROM ubuntu:22.04

# 設定環境變數，避免互動式提示
ENV DEBIAN_FRONTEND=noninteractive

# 更新套件並一次性安裝所有開發工具與依賴
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    build-essential \
    software-properties-common \
    cmake \
    git \
    vim \
    gdb \
    libcurl4-openssl-dev \
    python3 \
    python3-pip \
    python3-venv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 建立一個工作目錄
WORKDIR /workspace

# git clone llama.cpp 專案
ARG REPO_URL=https://github.com/leon123858/llama.cpp.git
ARG REPO_NAME=llama.cpp
ARG REPO_BRANCH=dev
RUN git clone --recurse-submodules $REPO_URL $REPO_NAME

# 設定工作目錄到專案中
WORKDIR /workspace/$REPO_NAME
RUN git checkout $REPO_BRANCH
RUN git pull

# compile
RUN cmake -B build -DCMAKE_BUILD_TYPE=Debug
RUN cmake --build build

# 開放埠號
EXPOSE 22
EXPOSE 8080

# 設定預設進入點為 bash
CMD ["/bin/bash"]
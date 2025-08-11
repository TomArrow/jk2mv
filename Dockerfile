FROM mcr.microsoft.com/devcontainers/cpp:ubuntu-22.04

# Install required libraries and tools
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    ninja-build \
    libsdl2-dev \
    libopenal-dev \
    libjpeg-dev \
    libpng-dev \
    libminizip-dev \
    zlib1g-dev \
    clang \
    gcc \
    g++ \
    ccache \
    gdb \
    valgrind \
    git \
    && apt-get clean

# Install latest CMake (v3.29.2)
RUN curl -L https://github.com/Kitware/CMake/releases/download/v3.29.2/cmake-3.29.2-linux-x86_64.tar.gz \
    | tar xz -C /opt && \
    ln -s /opt/cmake-3.29.2-linux-x86_64/bin/cmake /usr/local/bin/cmake

# Enable CCache by default
RUN echo 'export PATH="/usr/lib/ccache:$PATH"' >> /etc/profile.d/ccache.sh


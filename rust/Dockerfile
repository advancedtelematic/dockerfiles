FROM debian:jessie

RUN apt-get update && apt-get install -y \
    autoconf \
    build-essential \
    ca-certificates \
    curl \
    file \
    git \
    libdbus-1-dev \
    libtool \
    musl-tools \
    openssl \
    sudo \
  && rm -rf /var/lib/apt/lists/*

RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable -y \
  && /root/.cargo/bin/rustup target add x86_64-unknown-linux-musl \
  && /root/.cargo/bin/rustup toolchain install 1.7.0

ENV \
  PATH=/root/.cargo/bin:$PATH \
  OPENSSL_VERSION=1.0.2h \
  OPENSSL_LIB_DIR=/usr/local/ssl/lib \
  OPENSSL_INCLUDE_DIR=/usr/local/ssl/include \
  OPENSSL_STATIC=1

RUN curl https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz -O \
  && tar -xzf openssl-${OPENSSL_VERSION}.tar.gz \
  && cd openssl-${OPENSSL_VERSION} && ./config -fPIC && make depend && make install \
  && cd .. && rm -rf openssl-${OPENSSL_VERSION}*

VOLUME /build
WORKDIR /build

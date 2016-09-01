FROM debian:7

RUN apt-get update && apt-get install -y \
    autoconf \
    build-essential \
    ca-certificates \
    curl \
    file \
    git \
    libdbus-1-dev \
    libtool \
    openssl \
    sudo \
  && rm -rf /var/lib/apt/lists/*

ENV \
  PATH=/root/.cargo/bin:$PATH \
  OPENSSL_VERSION=1.0.2h \
  OPENSSL_LIB_DIR=/usr/local/ssl/lib \
  OPENSSL_INCLUDE_DIR=/usr/local/ssl/include \
  OPENSSL_STATIC=1

# compile openssl for static linking
RUN curl https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz -O \
  && tar -xzf openssl-${OPENSSL_VERSION}.tar.gz \
  && cd openssl-${OPENSSL_VERSION} && ./config -fPIC && make depend && make install \
  && cd .. && rm -rf openssl-${OPENSSL_VERSION}*

# download rustup and install additional toolchains
RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable -y \
  && /root/.cargo/bin/rustup target add x86_64-unknown-linux-musl \
  && /root/.cargo/bin/rustup toolchain install 1.7.0 \
  && /root/.cargo/bin/rustup toolchain install 1.10.0 \
  && /root/.cargo/bin/rustup toolchain install nightly

# install rust-clippy using nightly rustc
RUN git clone https://github.com/Manishearth/rust-clippy.git /root/rust-clippy \
  && cd /root/rust-clippy \
  && rustup override set nightly \
  && cargo install \
  && rm -rf /root/rust-clippy

# install musl-tools for static linking
RUN git clone git://git.musl-libc.org/musl /root/musl \
  && cd /root/musl && ./configure && make && make install \
  && ln -s /usr/local/musl/bin/musl-gcc /usr/bin/musl-gcc \
  && curl https://ftp.gnu.org/gnu/binutils/binutils-2.27.tar.gz | tar zxv \
  && cd binutils-2.27 && ./configure --prefix=/usr && make && make install \
  && rm -rf /root/musl

VOLUME /build
WORKDIR /build

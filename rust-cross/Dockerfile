FROM ubuntu:precise

RUN apt-get update && apt-get install -y \
    autoconf \
    build-essential \
    ca-certificates \
    curl \
    file \
    gcc-arm-linux-gnueabihf \
    git \
    libdbus-1-dev \
    libssl-dev \
    libtool \
    openssl \
    sudo \
  && rm -rf /var/lib/apt/lists/*

# set target and cross-compiler
ENV PATH=/root/.cargo/bin:$PATH \
  TARGET=armv7-unknown-linux-gnueabihf \
  CC=arm-linux-gnueabihf-gcc \
  AR=arm-linux-gnueabihf-ar

# install target libstd
ENV RUSTC_VERSION=1.10.0
RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain $RUSTC_VERSION -y \
  && rustup target add $TARGET

# cross-compile expat (for dbus)
ENV EXPAT_VERSION=2.2.0
RUN curl -sL http://ftp.vim.org/mediaplayer/xbmc/build-deps/sources/expat-$EXPAT_VERSION.tar.bz2 | tar xj \
  && cd expat-$EXPAT_VERSION && ./configure --prefix=/root/expat/ --host=arm-linux-gnueabi \
  && make -j$(nproc) && make install

# cross-compile dbus
ENV DBUS_VERSION=1.6.30
RUN curl -sL https://dbus.freedesktop.org/releases/dbus/dbus-$DBUS_VERSION.tar.gz | tar xz \
  && cd dbus-$DBUS_VERSION && LDFLAGS="-L/root/expat/lib" CFLAGS="-I/root/expat/include" ./configure \
    --prefix=/root/dbus/ --host=arm-linux-gnueabi --enable-abstract-sockets \
  && make -j$(nproc) && make install

# cross-compile openssl
ENV OPENSSL_VERSION=1.0.2j
RUN curl -sL https://openssl.org/source/openssl-$OPENSSL_VERSION.tar.gz | tar xz \
  && cd openssl-$OPENSSL_VERSION && ./Configure linux-armv4 --prefix=/root/openssl -fPIC \
  && make -j$(nproc) && make install

# set pkg-config flags: https://docs.rs/pkg-config
ENV PKG_CONFIG_ALLOW_CROSS=1 \
  PKG_CONFIG_PATH="/root/openssl/lib/pkgconfig:/root/dbus/lib/pkgconfig"

COPY config /root/.cargo/config
WORKDIR /src

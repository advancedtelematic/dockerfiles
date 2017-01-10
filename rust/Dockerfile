FROM ubuntu:precise
MAINTAINER Shaun Taheri <shaun@advancedtelematic.com>

RUN apt-get update && apt-get install -y \
    autoconf \
    build-essential \
    ca-certificates \
    curl \
    file \
    gcc-arm-linux-gnueabi \
    gcc-arm-linux-gnueabihf \
    git \
    libdbus-1-dev \
    libssl-dev \
    libtool \
    openssl \
    sudo \
  && rm -rf /var/lib/apt/lists/*

ENV PATH=/root/.cargo/bin:$PATH
ARG armel_cc=arm-linux-gnueabi-gcc
ARG armhf_cc=arm-linux-gnueabihf-gcc

# compile expat (for dbus)
ARG expat_version=2.2.0
ARG expat_x86_flags="--host=x86_64 --prefix=/x86/expat"
ARG expat_armel_flags="--host=arm-linux-gnueabi --prefix=/armel/expat"
ARG expat_armhf_flags="--host=arm-linux-gnueabihf --prefix=/armhf/expat"
RUN curl -sL http://ftp.vim.org/mediaplayer/xbmc/build-deps/sources/expat-$expat_version.tar.bz2 | tar xj \
  && cd expat-$expat_version \
  && ./configure $expat_x86_flags && make -j$(nproc) && make install && make clean \
  && CC=$armel_cc ./configure $expat_armel_flags && make -j$(nproc) && make install && make clean \
  && CC=$armhf_cc ./configure $expat_armhf_flags && make -j$(nproc) && make install && make clean \
  && cd .. && rm -rf expat-$expat_version

# compile dbus
ARG dbus_version=1.6.30
ARG dbus_x86_ldflags="-L/x86/expat/lib"
ARG dbus_x86_cflags="-I/x86/expat/include"
ARG dbus_x86_flags="--prefix=/x86/dbus/ --enable-abstract-sockets"
ARG dbus_armel_ldflags="-L/armel/expat/lib"
ARG dbus_armel_cflags="-I/armel/expat/include"
ARG dbus_armel_flags="--prefix=/armel/dbus/ --host=arm-linux-gnueabi --enable-abstract-sockets"
ARG dbus_armhf_ldflags="-L/armhf/expat/lib"
ARG dbus_armhf_cflags="-I/armhf/expat/include"
ARG dbus_armhf_flags="--prefix=/armhf/dbus/ --host=arm-linux-gnueabihf --enable-abstract-sockets"
RUN curl -sL https://dbus.freedesktop.org/releases/dbus/dbus-$dbus_version.tar.gz | tar xz \
  && cd dbus-$dbus_version \
  && LDFLAGS=$dbus_x86_ldflags CFLAGS=$dbus_x86_cflags ./configure $dbus_x86_flags && make -j$(nproc) && make install && make clean \
  && LDFLAGS=$dbus_armel_ldflags CFLAGS=$dbus_armel_cflags CC=$armel_cc ./configure $dbus_armel_flags && make -j$(nproc) && make install && make clean \
  && LDFLAGS=$dbus_armhf_ldflags CFLAGS=$dbus_armhf_cflags CC=$armhf_cc ./configure $dbus_armhf_flags && make -j$(nproc) && make install && make clean \
  && cd .. && rm -rf dbus-$dbus_version

# compile openssl
ARG openssl_version=1.0.1u
ARG openssl_x86_flags="linux-x86_64 --prefix=/x86/ssl -fPIC shared"
ARG openssl_armel_flags="linux-armv4 --prefix=/armel/ssl -fPIC shared"
ARG openssl_armhf_flags="linux-armv4 --prefix=/armhf/ssl -fPIC shared"
RUN curl https://www.openssl.org/source/openssl-$openssl_version.tar.gz | tar xz \
  && cd openssl-$openssl_version \
  && ./Configure $openssl_x86_flags && make -j$(nproc) && make install && make clean \
  && CC=$armel_cc ./Configure $openssl_armel_flags && make -j$(nproc) && make install && make clean \
  && CC=$armhf_cc ./Configure $openssl_armhf_flags && make -j$(nproc) && make install && make clean \
  && cd .. && rm -rf openssl-$openssl_version

# install rust
ARG rustc_version=stable
RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain $rustc_version -y \
  && rustup target add x86_64-unknown-linux-musl \
  && rustup target add arm-unknown-linux-gnueabi \
  && rustup target add arm-unknown-linux-gnueabihf \
  && rustup target add armv7-unknown-linux-gnueabihf

COPY config /root/.cargo/config

VOLUME /src
WORKDIR /src

# set library paths
ARG arch=x86
ENV PKG_CONFIG_ALLOW_CROSS=1 \
  PKG_CONFIG_PATH="/$arch/ssl/lib/pkgconfig:/$arch/dbus/lib/pkgconfig"

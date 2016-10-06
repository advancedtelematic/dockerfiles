FROM nastevens/arm-musl-rust
# https://github.com/nastevens/docker-rust-arm-musl

ENV \
  SSL_VER=1.0.2h \
  PREFIX=/usr/local \
  CC=arm-linux-musleabi-gcc \
  RANLIB=arm-linux-musleabi-ranlib

USER root
WORKDIR /

RUN curl -sL http://www.openssl.org/source/openssl-$SSL_VER.tar.gz | tar xz \
  && cd openssl-$SSL_VER \
  && ./Configure linux-armv4 --prefix=$PREFIX --openssldir=$PREFIX/ssl no-shared -fPIC no-dso \
  && make \
  && make install

COPY config /.cargo/config
USER rustbuild
WORKDIR /source

ENV \
  OPENSSL_LIB_DIR=$PREFIX/lib \
  OPENSSL_INCLUDE_DIR=$PREFIX/include \
  OPENSSL_STATIC=1

FROM alpine:3.5

ENV E2TOOLS_VERSION 0.0.16

RUN apk add --update --no-cache --virtual .build-deps \
        autoconf \
        gcc \
        make \
  && apk add --no-cache \
         e2fsprogs-dev \
         libc-dev

RUN mkdir /src \
  && wget http://home.earthlink.net/~k_sheff/sw/e2tools/e2tools-$E2TOOLS_VERSION.tar.gz \
  && tar xf e2tools-$E2TOOLS_VERSION.tar.gz \
  && cd e2tools-$E2TOOLS_VERSION \
  && autoconf \
  && ./configure \
  && make \
  && make install \
  && rm -rf /src \
  && apk del .build-deps

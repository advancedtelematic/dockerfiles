FROM alpine:3.9

RUN apk add --no-cache bash

ENV RELEASE_VERSION=1.22.0

ENV DHALL_BASH_VERSION=1.0.20
ENV DHALL_JSON_VERSION=1.2.8
ENV DHALL_TEXT_VERSION=1.0.17

ENV SUFFIX=x86_64-linux.tar.bz2

ENV DHALL_FILE_NAME=dhall-$RELEASE_VERSION-$SUFFIX
ENV DHALL_BASH_FILE_NAME=dhall-bash-$DHALL_BASH_VERSION-$SUFFIX
ENV DHALL_JSON_FILE_NAME=dhall-json-$DHALL_JSON_VERSION-$SUFFIX
ENV DHALL_TEXT_FILE_NAME=dhall-text-$DHALL_TEXT_VERSION-$SUFFIX

ENV URL_PREFIX=https://github.com/dhall-lang/dhall-haskell/releases/download/$RELEASE_VERSION

WORKDIR /opt

RUN wget $URL_PREFIX/$DHALL_FILE_NAME && \
  tar -xvf $DHALL_FILE_NAME && cp bin/* /usr/bin && rm -r ./*
RUN [ "df19393197bd6c2a4334854509583f410806bd6d8e4a35e26bda08734357f358  /usr/bin/dhall" = "$(sha256sum /usr/bin/dhall)" ]

RUN wget $URL_PREFIX/$DHALL_BASH_FILE_NAME && \
  tar -xvf $DHALL_BASH_FILE_NAME && cp bin/* /usr/bin && rm -r ./*
RUN [ "6844d8e34b1cf549a12151d32eca522ce4c33e4bf3ffddc009044bb937ef63a0  /usr/bin/dhall-to-bash" = "$(sha256sum /usr/bin/dhall-to-bash)" ]

RUN wget $URL_PREFIX/$DHALL_JSON_FILE_NAME && \
  tar -xvf $DHALL_JSON_FILE_NAME && cp bin/* /usr/bin && rm -r ./*
RUN [ "ada0e43516413dc8daad8a5b5d7cb3ae7bc2b52db4022da0bcd8c142c1186a06  /usr/bin/dhall-to-json" = "$(sha256sum /usr/bin/dhall-to-json)" ]
RUN [ "1a4fb6b42a5eb2e497a0e185f289c0bf6f2e590d80086f716440bcca02938350  /usr/bin/dhall-to-yaml" = "$(sha256sum /usr/bin/dhall-to-yaml)" ]

RUN wget $URL_PREFIX/$DHALL_TEXT_FILE_NAME && \
  tar -xvf $DHALL_TEXT_FILE_NAME && cp bin/* /usr/bin && rm -r ./*
RUN [ "d82c3c805f7ce55e8ebe5a02b905abacf00bb2b59b76d5579d1111dc3cdcec34  /usr/bin/dhall-to-text" = "$(sha256sum /usr/bin/dhall-to-text)" ]

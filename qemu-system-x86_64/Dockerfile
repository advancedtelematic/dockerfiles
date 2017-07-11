FROM alpine:3.5

ENV QEMU_VERSION 2.9.0

RUN apk add --update --upgrade --no-cache libtool \
  && apk add --no-cache --virtual .build-deps \
     autoconf \
     automake \
     g++ \
     libfdt \
     linux-headers \
     make \
     pixman \
     python \
  && apk add --no-cache \
     glib-dev \
     libc-dev \
     zlib-dev

RUN mkdir /src \
    && cd /src \
    && wget http://download.qemu-project.org/qemu-$QEMU_VERSION.tar.xz \
    && tar xvJf qemu-$QEMU_VERSION.tar.xz \
    && cd qemu-$QEMU_VERSION \
    && ./configure --disable-kvm --target-list="x86_64-softmmu" \
    && make \
    && make install \
    && rm -rf /src \
    && apk del .build-deps

ENTRYPOINT ["qemu-system-x86_64"]

FROM debian:stretch-slim

RUN apt-get update && apt-get install -y \
    autoconf \
    bison \
    build-essential \
    curl \
    e2fslibs-dev \
    git \
    gtk-doc-tools \
    libarchive-dev \
    libcurl4-openssl-dev \
    libfuse-dev \
    libgpgme-dev \
    libgtk-3-dev \
    liblzma-dev \
    libsoup2.4-dev \
    libsystemd-dev \
  && rm -rf /var/lib/apt/lists/*

ENV LD_LIBRARY_PATH=/usr/local/lib

ARG branch=master
RUN git clone https://github.com/advancedtelematic/ostree.git \
  && cd /ostree \
  && git checkout "$branch" \
  && git submodule update --init \
  && NOCONFIGURE=1 ./autogen.sh \
  && ./configure \
    --disable-gtk-doc \
    --disable-gtk-doc-html \
    --disable-gtk-doc-pdf \
    --disable-man \
    --enable-wrpseudo-compat \
    --with-builtin-grub2-mkconfig \
    --with-curl \
    --with-libarchive \
    --with-smack \
  && make -j8 \
  && make install

COPY scripts/ /usr/local/bin

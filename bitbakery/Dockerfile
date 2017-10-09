FROM ubuntu:xenial
MAINTAINER Robert Danitz <robert@advancedtelematic.com>

ENV TARGET="qemux86-64"
ENV IMAGE="core-image-minimal"
ENV SRC_DIR="/opt/src"
ENV BUILD_DIR="/tmp/build"
ENV OUT_DIR="/var/opt/bitbake-artifacts"
ENV CACHE_DIR="/var/cache/sstate-cache"

# install dependencies

RUN apt-get update -q && \
    apt-get install -qy build-essential bzip2 chrpath cpio diffstat gawk gcc-multilib git-core libsdl1.2-dev locales python3 qemu socat sudo texinfo unzip wget xterm inetutils-ping && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LC_ALL="en_US.UTF-8"
ENV LANG="en_US.UTF-8"
ENV LANGUAGE="en_US.UTF-8"
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen

ADD run.sh /usr/local/bin
CMD ["bash", "-C", "run.sh"]

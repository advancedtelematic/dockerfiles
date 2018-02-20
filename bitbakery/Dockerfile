FROM debian:stretch-slim
MAINTAINER Robert Danitz <robert@advancedtelematic.com>

ENV TARGET="qemux86-64"
ENV IMAGE="core-image-minimal"
ENV SRC_DIR="/opt/updater-repo"
ENV BUILD_DIR="/tmp/build"
ENV OUT_DIR="/var/opt/bitbake-artifacts"
ENV BITBAKE_FLAGS=""
ENV CONF_DIR="/opt/conf"

# install dependencies

# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=863199
RUN mkdir -p /usr/share/man/man1

RUN apt-get update -q && \
    apt-get install -qy build-essential bzip2 chrpath cpio default-jre diffstat gawk gcc-multilib git-core libsdl1.2-dev locales python3 qemu socat sudo texinfo unzip wget xterm inetutils-ping python iproute procps && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LC_ALL="en_US.UTF-8"
ENV LANG="en_US.UTF-8"
ENV LANGUAGE="en_US.UTF-8"
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen

ADD bitbake.sh /usr/local/bin
ENTRYPOINT ["/usr/bin/env", "bash", "-c", "/usr/local/bin/bitbake.sh"]

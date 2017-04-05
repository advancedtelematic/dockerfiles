FROM buildpack-deps
MAINTAINER Robert Danitz <robert@advancedtelematic.com>

ENV SRC_DIR="/opt/agl-repo"
ENV BUILD_DIR="/tmp/build"
ENV OUT_DIR="/var/opt/bitbake-artifacts"
ENV CACHE_DIR="/var/cache/sstate-cache"

# install dependencies

RUN apt-get update -q && \
    apt-get install -qy \
    gawk wget git-core diffstat unzip texinfo gcc-multilib \
    build-essential chrpath socat libsdl1.2-dev xterm qemu \
    cpio locales python-virtualenv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LC_ALL="en_US.UTF-8"
ENV LANG="en_US.UTF-8"
ENV LANGUAGE="en_US.UTF-8"
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# setup user

RUN groupadd -r bitbake && useradd --shell /bin/bash -r -g bitbake bitbake -m

RUN mkdir -p $CACHE_DIR && \
    chown bitbake:bitbake $CACHE_DIR && \
    chown bitbake:bitbake $CACHE_DIR

ADD run.sh /usr/local/bin

USER bitbake

RUN virtualenv $HOME/.env

CMD ["bash", "-C", "run.sh"]

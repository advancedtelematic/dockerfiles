FROM debian:jessie

RUN apt-get update && apt-get install -y \
    curl \
    file \
    sudo \
  && rm -rf /var/lib/apt/lists/*

RUN curl https://sh.rustup.rs > rustup.rs \
  && sh rustup.rs -y \
  && . $HOME/.cargo/env \
  && echo 'source $HOME/.cargo/env' >> $HOME/.bashrc \
  && rustup target add x86_64-unknown-linux-musl \
  && rustup toolchain install 1.7.0

VOLUME /build
WORKDIR /build

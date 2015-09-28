FROM ubuntu

ENV REFRESHED_AT=2015-09-28

RUN apt-get update \
 && apt-get upgrade -y

RUN apt-get install -y curl openssl file

COPY rustup.sha1 rustup.sha1

RUN curl -o rustup.sh https://static.rust-lang.org/rustup.sh \
 && sha1sum -c rustup.sha1 \
 && sh rustup.sh --disable-sudo --yes

FROM debian:8

RUN apt-get update && apt-get install -y \
    curl \
    devscripts \
    dh-systemd \
    gettext \
    patch \
    rpm \
    ruby \
    ruby-dev \
  && rm -rf /var/lib/apt/lists/*

ENV FPM_VER 1.6.0
RUN gem install fpm -v ${FPM_VER}

# apply patch to add --rpm-service flag
COPY pr862.patch /
RUN patch -i /pr862.patch /var/lib/gems/2.1.0/gems/fpm-${FPM_VER}/lib/fpm/package/rpm.rb

# install rq
ENV RQ_VERSION=0.9.2
RUN curl -SL https://github.com/dflemstr/rq/releases/download/v${RQ_VERSION}/rq-x86_64-unknown-linux-musl \
  -o /usr/local/bin/rq

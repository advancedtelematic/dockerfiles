FROM advancedtelematic/rust

RUN apt-get update && apt-get install -y \
    devscripts \
    dh-systemd \
    gettext \
    httpie \
    jq \
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
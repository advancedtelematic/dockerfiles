FROM ruby:alpine

# Here we install GNU libc (aka glibc) and set C.UTF-8 locale as default.
# This is necessary for pandoc.

RUN ALPINE_GLIBC_BASE_URL="https://github.com/sgerrand/alpine-pkg-glibc/releases/download" && \
    ALPINE_GLIBC_PACKAGE_VERSION="2.23-r3" && \
    ALPINE_GLIBC_BASE_PACKAGE_FILENAME="glibc-$ALPINE_GLIBC_PACKAGE_VERSION.apk" && \
    ALPINE_GLIBC_BIN_PACKAGE_FILENAME="glibc-bin-$ALPINE_GLIBC_PACKAGE_VERSION.apk" && \
    ALPINE_GLIBC_I18N_PACKAGE_FILENAME="glibc-i18n-$ALPINE_GLIBC_PACKAGE_VERSION.apk" && \
    apk add --no-cache --virtual=.build-dependencies wget ca-certificates && \
    wget \
        "https://raw.githubusercontent.com/andyshinn/alpine-pkg-glibc/master/sgerrand.rsa.pub" \
        -O "/etc/apk/keys/sgerrand.rsa.pub" && \
    wget \
        "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_PACKAGE_VERSION/$ALPINE_GLIBC_BASE_PACKAGE_FILENAME" \
        "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_PACKAGE_VERSION/$ALPINE_GLIBC_BIN_PACKAGE_FILENAME" \
        "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_PACKAGE_VERSION/$ALPINE_GLIBC_I18N_PACKAGE_FILENAME" && \
    apk add --no-cache \
        "$ALPINE_GLIBC_BASE_PACKAGE_FILENAME" \
        "$ALPINE_GLIBC_BIN_PACKAGE_FILENAME" \
        "$ALPINE_GLIBC_I18N_PACKAGE_FILENAME" && \
    \
    rm "/etc/apk/keys/sgerrand.rsa.pub" && \
    /usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 C.UTF-8 || true && \
    echo "export LANG=C.UTF-8" > /etc/profile.d/locale.sh && \
    \
    apk del glibc-i18n && \
    \
    rm "/root/.wget-hsts" && \
    apk del .build-dependencies && \
    rm \
        "$ALPINE_GLIBC_BASE_PACKAGE_FILENAME" \
        "$ALPINE_GLIBC_BIN_PACKAGE_FILENAME" \
        "$ALPINE_GLIBC_I18N_PACKAGE_FILENAME"

ENV LANG=C.UTF-8

ADD Gemfile /

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && echo http://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories

# We need build-base because some of the Ruby gems have native extensions. They're deleted \
# afterwards to slim the image down.
RUN apk add --update build-base libffi-dev openssl gmp graphicsmagick-dev && \
  bundle install --no-cache --clean && \
  apk del binutils-libs binutils isl libgomp libatomic libgcc mpfr3 mpc1 libstdc++ gcc \
  make musl-dev libc-dev fortify-headers g++ build-base && \
  rm /usr/local/bundle/cache/*

RUN apk add tar libarchive-tools && \
  mkdir temp && cd temp && \
  wget http://github.com/jgm/pandoc/releases/download/1.19.1/pandoc-1.19.1-1-amd64.deb && \
  bsdtar -xf pandoc-1.19.1-1-amd64.deb data.tar.gz && \
  tar zxvf data.tar.gz && \
  cp usr/bin/pandoc /usr/local/bin && \
  cd .. && rm -rf temp && \
  apk del tar libarchive-tools

RUN apk add bash py-pillow py-pip python && pip install cherrypy seqdiag actdiag nwdiag && apk del py-pip

ADD ats-doc-builder/pdf-themes /themes/
ADD ats-doc-builder/docx-themes /themes/
ADD bin/* /bin/

VOLUME /site
WORKDIR /site
ENTRYPOINT ["doctools.py"]


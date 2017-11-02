FROM ruby:alpine

COPY Gemfile /
COPY prawn-gmagick-0.0.9.gem /

RUN apk add --update --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.5/community \
    graphicsmagick-dev && \
  apk add --update --no-cache \
    build-base \
    libffi-dev \
    openssl \
    gmp \
    python && \
  cd / && gem install prawn-gmagick-0.0.9.gem && \
  bundle install --no-cache --clean && \
  apk del \
    binutils-libs \
    binutils \
    isl \
    libgomp \
    libatomic \
    libgcc \
    mpfr3 \
    mpc1 \
    libstdc++ \
    gcc \
    make \
    musl-dev \
    libc-dev \
    fortify-headers \
    g++ \
    build-base && \
  rm -rf /usr/local/bundle/cache/* /root/.bundle /root/.gem

# Add pandoc
RUN apk add --no-cache cmark --repository http://nl.alpinelinux.org/alpine/edge/testing && \
  apk add --no-cache --allow-untrusted pandoc --repository https://conoria.gitlab.io/alpine-pandoc/

# Add mermaid.cli
# RUN apk add --update -X http://dl-cdn.alpinelinux.org/alpine/edge/community yarn && \
#   yarn global add mermaid.cli && \
#   ln `which mmdc` /usr/local/bin/mermaid

COPY ats-doc-builder/pdf-themes /themes/
COPY ats-doc-builder/docx-themes /themes/
COPY ats-doc-builder/bin/* /bin/

VOLUME /site
WORKDIR /site
ENTRYPOINT ["doctools.py"]
LABEL io.whalebrew.config.volumes '["~/.pdf-themes:/themes/user"]'
LABEL io.whalebrew.config.working_dir '/site'

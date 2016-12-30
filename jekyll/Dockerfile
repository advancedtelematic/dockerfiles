FROM ruby:2.2.6-alpine

ADD Gemfile /

# We need build-base because some of the Ruby gems have native extensions. They're deleted \
# afterwards to slim the image down.
RUN apk add --update build-base ruby-dev python && \
  bundle install --no-cache --clean && \
  apk del build-base ruby-dev && \
  rm /usr/local/bundle/cache/*

VOLUME /site
WORKDIR /site
CMD ["jekyll", "b"]

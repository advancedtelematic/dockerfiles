FROM ruby:2.2.6-alpine

ADD Gemfile /

# We need build-base because some of the Ruby gems have native extensions. They're deleted \
# afterwards to slim the image down.
RUN apk add --update build-base ruby-dev python openjdk7-jre-base && \
  bundle install --no-cache --clean && \
  apk del build-base ruby-dev && \
  rm /usr/local/bundle/cache/*

# make s3_website download its jar
RUN bundle exec s3_website install

# Some scripts that use this container need /bin/bash.
RUN apk add bash

VOLUME /site
WORKDIR /site
CMD ["jekyll", "b"]

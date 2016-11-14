FROM debian

RUN apt-get update \
 && apt-get install -y nodejs-dev npm

RUN cp /usr/bin/nodejs /usr/bin/node

RUN npm install -g swagger-cli

WORKDIR src

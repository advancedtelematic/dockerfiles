FROM ubuntu:18.04

ENV UBUNTU_VERSION 18.04
ENV GARAGE_DEPLOY_VERSION 2018.11

RUN  apt-get update \
  && apt-get install -y wget \
  && wget https://github.com/advancedtelematic/aktualizr/releases/download/$GARAGE_DEPLOY_VERSION/garage_deploy-ubuntu_$UBUNTU_VERSION.deb \
  && apt-get install -y ./garage_deploy-ubuntu_$UBUNTU_VERSION.deb \
  && rm -rf /var/lib/apt/lists/* ./garage_deploy-ubuntu_$UBUNTU_VERSION.deb

ENTRYPOINT ["garage-deploy"]
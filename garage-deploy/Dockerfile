FROM ubuntu:18.04

ENV UBUNTU_VERSION 18.04
ENV GARAGE_DEPLOY_VERSION 2018.11

RUN  apt-get update \
  && apt-get install -y wget \
  && wget https://github.com/advancedtelematic/aktualizr/releases/download/$GARAGE_DEPLOY_VERSION/garage_deploy-ubuntu_$UBUNTU_VERSION.deb \
  && sha256sum ./garage_deploy-ubuntu_$UBUNTU_VERSION.deb \
       | grep bd53b60c52b8f730aea1def6f817ca5a5c08e67ad2923eb4cbc69d9e98920a83 \
  && apt-get install -y ./garage_deploy-ubuntu_$UBUNTU_VERSION.deb \
  && rm -rf /var/lib/apt/lists/* ./garage_deploy-ubuntu_$UBUNTU_VERSION.deb

ENTRYPOINT ["garage-deploy"]
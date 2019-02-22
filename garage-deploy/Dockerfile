FROM ubuntu:18.04

ENV UBUNTU_VERSION 18.04
ENV GARAGE_DEPLOY_VERSION 2019.2

RUN  apt-get update \
  && apt-get install -y wget \
  && wget https://github.com/advancedtelematic/aktualizr/releases/download/$GARAGE_DEPLOY_VERSION/garage_deploy-ubuntu_$UBUNTU_VERSION.deb \
  && sha256sum ./garage_deploy-ubuntu_$UBUNTU_VERSION.deb \
       | grep 183486aa4534c510113bc4fc2e020552df29df8cd7c15e3b57a8627284cd44d0 \
  && apt-get install -y ./garage_deploy-ubuntu_$UBUNTU_VERSION.deb \
  && rm -rf /var/lib/apt/lists/* ./garage_deploy-ubuntu_$UBUNTU_VERSION.deb

ENTRYPOINT ["garage-deploy"]

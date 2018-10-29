FROM debian

RUN apt-get update && apt-get install -y apt-transport-https curl gnupg2
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubectl

ENTRYPOINT kubectl
ARG ["proxy"]

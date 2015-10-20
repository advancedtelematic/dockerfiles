FROM docker

RUN apk update \
 && apk add bash python py-pip \
 && pip install awscli

COPY run.sh /bin/run.sh
RUN chmod +x /bin/run.sh

ENTRYPOINT ["/bin/run.sh"]

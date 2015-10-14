FROM advancedtelematic/erlang:R16B03
ENV REFRESHED_AT 2015-09-04

RUN apt-get update; \
    apt-get install -y git bluetooth libbluetooth-dev python

RUN git clone https://github.com/PDXostc/rvi_core /rvi_core

WORKDIR /rvi_core

RUN git checkout 7e826fdfbc14efd2cb0e2594591f4e2b1d3c8ff2; \
    make; \
    mkdir components/rvi; \
    cp -r ebin components/rvi

ADD rvi_client.config rvi_client.config
ADD rvi_server.config rvi_server.config
ADD rvi_common.config priv/config/rvi_common.config
ADD sota_certs_client sota_certs_client
ADD sota_certs_server sota_certs_server
ADD sota_keys sota_keys
ADD run.sh run.sh
RUN chmod +x run.sh

EXPOSE 8801-8807
EXPOSE 8901-8907

ENTRYPOINT ["/rvi_core/run.sh"]
CMD ["server"]

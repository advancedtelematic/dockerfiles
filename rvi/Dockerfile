FROM advancedtelematic/erlang:R16B03
ENV REFRESHED_AT 2015-07-22

RUN apt-get update; \
    apt-get install -y git bluetooth libbluetooth-dev

RUN git clone https://github.com/advancedtelematic/rvi_core /rvi
WORKDIR /rvi
RUN git checkout fix/sample-local-nodes

RUN make; \
    mkdir components/rvi; \
    cp -r ebin components/rvi

ADD run.sh run.sh
ENTRYPOINT ["/rvi/run.sh"]

# Last to leverage docker caching
ADD rvi_server.config rvi_server.config
ADD rvi_client.config rvi_client.config

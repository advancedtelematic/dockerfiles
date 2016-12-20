FROM debian:jessie

RUN apt-get update && \
    apt-get install -y libbluetooth3 bluez python-jsonrpclib wget

RUN echo "deb http://packages.erlang-solutions.com/debian jessie contrib" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --force-yes esl-erlang

WORKDIR /opt
RUN wget https://github.com/PDXostc/rvi_core/releases/download/v0.5.0/rvi_0.5.0-1_amd64.deb && \
    dpkg -i rvi_0.5.0-1_amd64.deb
RUN rm /usr/lib/rvi_core/priv/keys/insecure_device_key.pem && \
    wget -O /usr/lib/rvi_core/priv/keys/device_key.pem https://raw.githubusercontent.com/GENIVI/rvi_core/develop/priv/keys/insecure_device_key.pem
RUN rm /usr/lib/rvi_core/priv/keys/insecure_root_key.pem && \
    wget -O /usr/lib/rvi_core/priv/keys/root_key.pem https://raw.githubusercontent.com/GENIVI/rvi_core/develop/priv/keys/insecure_root_key.pem
RUN rm /usr/lib/rvi_core/priv/certificates/insecure_device_cert.crt && \
    wget -O /usr/lib/rvi_core/priv/certificates/device_cert.crt https://raw.githubusercontent.com/GENIVI/rvi_core/develop/priv/certificates/insecure_device_cert.crt
RUN rm /usr/lib/rvi_core/priv/certificates/insecure_root_cert.crt && \
    wget -O /usr/lib/rvi_core/priv/certificates/root_cert.crt https://raw.githubusercontent.com/GENIVI/rvi_core/develop/priv/certificates/insecure_root_cert.crt
RUN rm /usr/lib/rvi_core/priv/credentials/insecure_credential.json && \
    wget -O /usr/lib/rvi_core/priv/credentials/credential.json https://raw.githubusercontent.com/GENIVI/rvi_core/develop/priv/credentials/insecure_credential.json
RUN rm /usr/lib/rvi_core/priv/credentials/insecure_credential.jwt && \
    wget -O /usr/lib/rvi_core/priv/credentials/credential.jwt https://raw.githubusercontent.com/GENIVI/rvi_core/develop/priv/credentials/insecure_credential.jwt


COPY backend.rvi.config /etc/rvi/
COPY device.rvi.config /etc/rvi/
COPY run_rvi.sh /usr/bin/run_rvi.sh

ENTRYPOINT ["/usr/bin/run_rvi.sh"]
CMD ["backend"]

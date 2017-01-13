FROM debian:jessie-slim

COPY erlang_solutions.asc /
RUN echo "deb http://packages.erlang-solutions.com/debian jessie contrib" >> /etc/apt/sources.list \
  && apt-key add erlang_solutions.asc \
  && rm erlang_solutions.asc

RUN apt-get update && apt-get install -y \
    bluez \
    esl-erlang \
    libbluetooth3 \
    python-jsonrpclib \
    wget \
  && rm -rf /var/lib/apt/lists/*

ARG rvi_version=0.5.1
RUN wget https://github.com/GENIVI/rvi_core/releases/download/v${rvi_version}/rvi_${rvi_version}-1_amd64.deb \
  && dpkg -i rvi_${rvi_version}-1_amd64.deb \
  && rm rvi_${rvi_version}-1_amd64.deb

RUN rm /usr/lib/rvi_core/deps/exo/priv/host.cert \
  && rm /usr/lib/rvi_core/deps/exo/priv/host.key \
  && ln -s /usr/lib/rvi_core/priv/certificates/device_cert.crt /usr/lib/rvi_core/deps/exo/priv/host.cert \
  && ln -s /usr/lib/rvi_core/priv/keys/device_key.pem /usr/lib/rvi_core/deps/exo/priv/host.key \
  && ln -s /usr/lib/rvi_core/priv/certificates/root_cert.crt /usr/local/share/ca-certificates/ \
  && update-ca-certificates

COPY backend.rvi.config /etc/rvi/
COPY device.rvi.config /etc/rvi/
COPY run_rvi.sh /usr/bin/run_rvi.sh

ENTRYPOINT ["/usr/bin/run_rvi.sh"]
CMD ["backend"]

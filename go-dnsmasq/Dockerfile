FROM alpine:3.10.1

RUN adduser -D dnsmasq

ADD https://github.com/janeczku/go-dnsmasq/releases/download/1.0.7/go-dnsmasq-min_linux-amd64 /usr/local/bin/go-dnsmasq
RUN chmod +x /usr/local/bin/go-dnsmasq

ENV DNSMASQ_LISTEN=0.0.0.0:5353
EXPOSE 5353 5353/udp

USER dnsmasq
ENTRYPOINT ["go-dnsmasq"]

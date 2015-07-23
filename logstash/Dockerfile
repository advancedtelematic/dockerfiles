FROM debian:jessie
RUN apt-get update && \
    apt-get install -y wget
RUN wget https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash_1.4.2-1-2c0f5a1_all.deb -O /tmp/logstash.deb && \
    wget https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash-contrib_1.4.2-1-efd53ef_all.deb -O /tmp/logstash-contrib.deb && \
    dpkg -i /tmp/logstash.deb ; \
    dpkg -i /tmp/logstash-contrib.deb ; \
    apt-get -f -y install && \
    rm -rf /tmp/logstash.deb /tmp/logstash-contrib.deb
COPY logstash.sample.conf /etc/logstash.sample.conf
COPY start-up.sh /etc/start-up.sh
RUN chmod +x /etc/start-up.sh

EXPOSE "5000/udp"
ENTRYPOINT ["/etc/start-up.sh"]

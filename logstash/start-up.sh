#!/bin/sh

sed -i "s/ELASTICSEARCH_HOST/$ELASTICSEARCH_PORT_9200_TCP_ADDR/g" /etc/logstash.sample.conf

exec /opt/logstash/bin/logstash $*

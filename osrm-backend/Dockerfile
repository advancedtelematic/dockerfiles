FROM ubuntu:14.04

RUN apt-get update && apt-get install -y apt-transport-https wget
RUN wget -q -O - https://ppa.openerp-experts.net/ppa.pub | apt-key add -
RUN echo "deb [arch=amd64] https://ppa.openerp-experts.net/ trusty main" > /etc/apt/sources.list.d/osrm.list
RUN apt-get update && apt-get install -y osrm.backend

VOLUME ["/var/lib/osrm/data"]
COPY osrm.conf /opt/osrm/etc/

EXPOSE 5000
ENTRYPOINT ["usr/bin/osrm-routed", "-c", "/opt/osrm/etc/osrm.conf", "/var/lib/osrm/data/map.osrm"]

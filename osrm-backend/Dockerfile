FROM ubuntu:14.04
MAINTAINER anael.lorimier@xcg-consulting.fr

# Install the HTTPS transport tool for apt

RUN apt-get update && apt-get install -y apt-transport-https wget
RUN wget -q -O - https://ppa.openerp-experts.net/ppa.pub | apt-key add -
RUN echo "deb [arch=amd64] https://ppa.openerp-experts.net/ trusty main" > /etc/apt/sources.list.d/xcg_ppa.list
RUN apt-get update && apt-get install -y osrm.backend
RUN mkdir -p /opt/osrm/etc /opt/osrm/bin

ADD sources/ /opt/osrm/bin/

VOLUME ["/opt/osrm/data", "opt/osrm/etc", "opt/osrm/stxxl", "opt/osrm/profiles"]

EXPOSE 5000

ENTRYPOINT ["/opt/osrm/bin/boot"]

CMD ["usr/bin/osrm-routed", "-c", "/opt/osrm/etc/osrm.conf", "/opt/osrm/data/map.osrm"]

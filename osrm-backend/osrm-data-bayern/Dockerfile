FROM advancedtelematic/osrm-backend:5.4.0

WORKDIR /osrm-backend
RUN mkdir -p data

RUN apt-get install -y wget
RUN wget http://download.geofabrik.de/europe/germany/bayern-latest.osm.pbf -O data/map.pbf

RUN osrm-extract -p profile.lua data/map.pbf
RUN osrm-contract data/map.osrm

EXPOSE 5000
ENTRYPOINT ["/usr/bin/osrm-routed", "data/map.osrm"]

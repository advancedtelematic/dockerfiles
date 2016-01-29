#!/bin/bash

echo "Building map from: $MAP_PBF_URL"

MAP_PBF=/opt/osrm/data/map.osm.pbf
if [ -f "$MAP_PBF" ]
then
  echo "Map exists: $MAP_PBF"
  exit 0
fi

cp /opt/osrm/etc/.stxxl .

wget $MAP_PBF_URL -O $MAP_PBF && \
osrm-extract -c /opt/osrm/etc/extractor.ini $MAP_PBF && \
osrm-prepare -p /opt/osrm/profiles/profile.lua /opt/osrm/data/map.osrm

rm .stxxl

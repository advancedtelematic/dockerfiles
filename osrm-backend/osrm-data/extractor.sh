#!/bin/bash

echo "Building map from: $MAP_PBF_URL"

MAP_PBF=/var/lib/osrm/data/map.osm.pbf
if [ -f "$MAP_PBF" ]
then
  echo "Map exists: $MAP_PBF"
else
  echo "Downloading $MAP_PBF_URL"
  wget $MAP_PBF_URL -O $MAP_PBF
fi


cd /osrm-backend
osrm-extract -p profiles/car.lua $MAP_PBF
osrm-contract /var/lib/osrm/data/map.osrm

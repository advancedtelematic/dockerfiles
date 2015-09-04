#!/bin/bash

docker rm -f rvi-server
docker run -it \
  -p 8801:8801 \
  -p 8805:8805 \
  -p 8806:8806 \
  -p 8807:8807 \
  -p 8808:8808 \
  --name rvi-server \
  advancedtelematic/rvi server

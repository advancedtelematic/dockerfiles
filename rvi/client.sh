#!/bin/bash

docker rm -f rvi-client
docker run -it \
  -p 8901:8901 \
  -p 8905:8905 \
  -p 8906:8906 \
  -p 8907:8907 \
  -p 8908:8908 \
  --name rvi-client \
  advancedtelematic/rvi client

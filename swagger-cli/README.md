# Swagger CLI

## Build

docker build -t advancedtelematic/swagger-cli .

## RUN

docker run -it --rm -v $(pwd):/src advancedtelematic/swagger-cli swagger validate swagger-file.json

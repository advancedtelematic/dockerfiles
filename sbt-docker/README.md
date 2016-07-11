# sbt-docker

This image is based on advancedtelematic/sbt, with docker added so that `sbt docker:publishLocal` works.

## Building

Build the usual way:

```
cd sbt-docker
docker build -t advancedtelematic/sbt-docker .
```

## Docker Version

The docker version is `docker-engine=1.10.0-0~jessie`, so that it matches the version installed on teamcity agents. Would be good to keep these in sync.

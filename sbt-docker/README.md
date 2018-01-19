# sbt-docker

This image is based on advancedtelematic/sbt, with docker added so that `sbt docker:publishLocal` works.

## Building

Build the usual way:

```
cd sbt-docker
docker build -t advancedtelematic/sbt-docker:${SBT_VERSION} .
```

## SBT and Docker Versions

```
docker run -it --entrypoint=sh advancedtelematic/sbt-docker:0.13.8
```
```
/app # docker version
Client:
 Version:      17.10.0-ce
 API version:  1.33
 Go version:   go1.9.2
 Git commit:   b22a36dc8a
 Built:        Tue Nov 21 07:44:20 2017
 OS/Arch:      linux/amd64
```
```
/app # sbt --version
sbt launcher version 0.13.8
```

# Tasty bitbakery

## Prerequisites

See https://github.com/advancedtelematic/agl-repo for obtaining the sources.

## Usage

To build the yocto image, run:

```sh
docker run --rm \
  -v /opt/agl-repo:/opt/agl-repo \
  -v bitbake-cache:/var/cache/sstate-cache \
  advancedtelematic/bitbakery
```

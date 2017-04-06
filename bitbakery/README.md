# Tasty bitbakery

## Prerequisites

See https://github.com/advancedtelematic/agl-repo for obtaining the sources.

## Usage

To build the yocto image, make sure the directories exist and belong to the current user, then run:

```sh
docker run --rm -u $(id -u) \
  -v /opt/agl-repo:/opt/agl-repo \
  -v /var/cache/sstate-cache:/var/cache/sstate-cache \
  -v /var/opt/bitbake-artifacts:/var/opt/bitbake-artifacts \
  advancedtelematic/bitbakery
```

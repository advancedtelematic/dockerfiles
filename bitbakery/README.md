# Tasty bitbakery

## Prerequisites

See https://github.com/advancedtelematic/updater-repo for obtaining the sources.

## Usage

To build the yocto image, make sure the directories exist and belong to the current user, then run:

```sh
docker run --rm \
  -e USER_ID=$(id -u) \
  -v /opt/conf/site.conf:/opt/site.conf:ro \
  -v /opt/updater-repo:/opt/src:ro \
  -v /var/cache/sstate-cache:/var/cache/sstate-cache \
  -v /var/opt/bitbake-artifacts:/var/opt/bitbake-artifacts \
  advancedtelematic/bitbakery
```

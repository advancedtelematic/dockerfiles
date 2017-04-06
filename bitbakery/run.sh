#!/bin/sh

. $SRC_DIR/meta-agl/scripts/aglsetup.sh -b $BUILD_DIR -m qemux86-64 agl-devel agl-sota agl-demo

# appending user-defined config
cat /opt/local.conf.append >> conf/local.conf || true

# prepare config
echo "SSTATE_DIR ?= \"$CACHE_DIR\"" \
  >> conf/local.conf
echo "SSTATE_MIRRORS ?= \"file://.* https://s3.eu-central-1.amazonaws.com/ats-sstate/yocto-sstate/PATH;downloadfilename=PATH\"" \
  >> conf/local.conf
echo "TMPDIR = \"$BUILD_DIR/tmp\"" \
  >> conf/local.conf

# build image
bitbake theatre-image
cp $BUILD_DIR/tmp/deploy/images/qemux86-64/*.otaimg $OUT_DIR
cp -r $BUILD_DIR/tmp/deploy/images/qemux86-64/ostree_repo $OUT_DIR

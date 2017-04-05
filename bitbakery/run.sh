#!/bin/sh

. $HOME/.env/bin/activate
. $SRC_DIR/meta-agl/scripts/aglsetup.sh -b $BUILD_DIR -m qemux86-64 agl-devel agl-sota agl-demo

# prepare config
echo "SSTATE_DIR ?= \"/var/cache/sstate-cache\"" \
  >> conf/local.conf
echo "SSTATE_MIRRORS ?= \"file://.* https://s3.eu-central-1.amazonaws.com/ats-sstate/yocto-sstate/PATH;downloadfilename=PATH\"" \
  >> conf/local.conf
echo "TMPDIR = \"$BUILD_DIR/tmp\"" \
  >> conf/local.conf

# build image
bitbake theatre-image
cp $BUILD_DIR/tmp/deploy/images/qemux86-64/*.otaimg $OUT_DIR
cp -r $BUILD_DIR/tmp/deploy/images/qemux86-64/ostree_repo $OUT_DIR

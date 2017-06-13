#!/bin/sh

# create myself
useradd --shell /bin/bash -u $USER_ID -o -c "" -m bitbake

id
exec sudo -u bitbake /bin/bash - << EOF
id

# path gnutls
cd $SRC_DIR/poky
wget -O patch.diff https://patchwork.openembedded.org/patch/133002/raw/
patch -p1 < patch.diff

. $SRC_DIR/env-init.sh qemux86-64

# appending user-defined config
cat /opt/local.conf.append >> conf/local.conf || true

# prepare config
echo "SSTATE_DIR ?= \"$CACHE_DIR\"" \
  >> conf/local.conf
echo "TMPDIR = \"$BUILD_DIR/tmp\"" \
  >> conf/local.conf

# build image
bitbake $IMAGE
cp $BUILD_DIR/tmp/deploy/images/qemux86-64/*-qemux86-64.otaimg $OUT_DIR
cp $BUILD_DIR/tmp/deploy/images/qemux86-64/u-boot.rom $OUT_DIR
cp -r $BUILD_DIR/tmp/deploy/images/qemux86-64/ostree_repo $OUT_DIR

EOF

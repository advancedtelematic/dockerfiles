#!/usr/bin/env bash

set -x

source $SRC_DIR/meta-updater/scripts/envsetup.sh $TARGET $BUILD_DIR

# appending user-defined config
cp $CONF_DIR/site.conf conf/

# build image
bitbake $BITBAKE_FLAGS $IMAGE
result=$?

if [ $result -eq 0 ]; then
  cp $BUILD_DIR/tmp/deploy/images/$TARGET/$IMAGE-$TARGET.ota* \
     $OUT_DIR
  cp $BUILD_DIR/tmp/deploy/images/$TARGET/u-boot.* \
     $OUT_DIR
  cp -r $BUILD_DIR/tmp/deploy/images/$TARGET/ostree_repo \
     $OUT_DIR
fi

exit $result

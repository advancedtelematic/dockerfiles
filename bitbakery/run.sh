#!/bin/sh

# create myself
useradd --shell /bin/bash -u $USER_ID -o -c "" -m bitbake -d /home/bitbake

id
exec sudo -u bitbake /bin/bash - << EOF
id

export HOME=/home/bitbake

source $SRC_DIR/meta-updater/scripts/envsetup.sh $TARGET $BUILD_DIR

# appending user-defined config
cp /opt/site.conf conf/

# build image
bitbake $BITBAKE_FLAGS $IMAGE
result=$?
cp $BUILD_DIR/tmp/deploy/images/$TARGET/$IMAGE-$TARGET.otaimg $OUT_DIR
cp $BUILD_DIR/tmp/deploy/images/$TARGET/u-boot.* $OUT_DIR
cp -r $BUILD_DIR/tmp/deploy/images/$TARGET/ostree_repo $OUT_DIR
exit $result
EOF

#!/bin/sh

KEY_DIR=$PWD/sota_keys
mkdir -p $KEY_DIR

cd ${RVI_DIR:-rvi_core}
scripts/rvi_create_root_key.sh -o $KEY_DIR/root -b 4096
python scripts/rvi_create_device_key.py -p $KEY_DIR/root_priv.pem -b 4096 -o $KEY_DIR/server
python scripts/rvi_create_device_key.py -p $KEY_DIR/root_priv.pem -b 4096 -o $KEY_DIR/client

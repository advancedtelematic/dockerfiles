#!/bin/sh

KEY_DIR=$PWD/sota_keys
OUT_DIR=$PWD/sota_certs_server
mkdir -p $OUT_DIR

cd ${RVI_DIR:-rvi_core}
python scripts/rvi_create_certificate.py \
  --id=5e5d2fb9-638c-43a3-a395-62e2c1f89b99 \
  --invoke="genivi.org/backend/sota/+" \
  --register="genivi.org/vin/+/sota/+" \
  --root_key="${KEY_DIR}/root_priv.pem" \
  --device_key="${KEY_DIR}/server_pub.pem" \
  --jwt_out="${OUT_DIR}/server.certificate.jwt" \
  --cert_out="${OUT_DIR}/server.certificate" \
  --start='2015-01-01 00:00:00' \
  --stop='2016-12-31 23:59:59' \
  --issuer="GenIVI"

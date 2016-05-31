#!/bin/sh

KEY_DIR=$PWD/sota_keys
OUT_DIR=$PWD/sota_certs_client
mkdir -p $OUT_DIR

cd ${RVI_DIR:-rvi_core}
python scripts/rvi_create_certificate.py \
  --id=f1630572-a977-4eff-907d-2a0a3c886d05 \
  --invoke="genivi.org/vin/V1234567890123456/sota/+" \
  --register="genivi.org/backend/sota/+" \
  --root_key="${KEY_DIR}/root_priv.pem" \
  --device_key="${KEY_DIR}/client_pub.pem" \
  --jwt_out="${OUT_DIR}/client.certificate.jwt" \
  --cert_out="${OUT_DIR}/client.certificate" \
  --start='2015-01-01 00:00:00' \
  --stop='2016-12-31 23:59:59' \
  --issuer="GenIVI"

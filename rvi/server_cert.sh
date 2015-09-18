#!/bin/sh
python scripts/rvi_create_certificate.py \
  --id=5e5d2fb9-638c-43a3-a395-62e2c1f89b99 \
  --register="genivi.org/backend/sota/+" \
  --invoke="genivi.org/vin/+/sota/notify genivi.org/vin/+/sota/start genivi.org/vin/+/sota/chunk genivi.org/vin/+/sota/finish" \
  --root_key=sota_keys/root_key_priv.pem \
  --device_key=sota_keys/backend_key_pub.pem \
  --jwt_out=sota_certs/backend.certificate.jwt \
  --cert_out=sota_certs/backend.certificate \
  --start='2015-01-01 00:00:00' \
  --stop='2015-12-31 23:59:59' \
  --issuer=genivi.org

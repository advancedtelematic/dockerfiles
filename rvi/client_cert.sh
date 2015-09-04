#!/bin/sh
python scripts/rvi_create_certificate.py \
  --id=f1630572-a977-4eff-907d-2a0a3c886d05 \
  --register="genivi.org/vin/+/sota/notify genivi.org/vin/+/sota/start genivi.org/vin/+/sota/chunk genivi.org/vin/+/sota/finish" \
  --invoke="genivi.org/backend/sota/ack genivi.org/backend/sota/initiate_download" \
  --root_key=sota_keys/root_key_priv.pem \
  --device_key=sota_keys/client_key_pub.pem \
  --jwt_out=sota_certs/client.certificate.jwt \
  --cert_out=sota_certs/client.certificate \
  --start='2015-01-01 00:00:00' \
  --stop='2015-12-31 23:59:59' \
  --issuer=genivi.org

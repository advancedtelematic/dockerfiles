#!/usr/bin/env bash

NODE_TYPE="${1:-backend}"
NODE_IP=$(ip route | awk '/default/ { print $3 }')
CONFIG="${CONFIG:-/etc/rvi/${NODE_TYPE}.rvi.config}"

echo "Node IP: $NODE_IP"
echo "Config: $CONFIG"

if ! test -f "$CONFIG"; then
  echo "FATAL: Config $CONFIG not found."
  exit 1
fi

export RVI_MYIP="${RVI_MYIP:-$NODE_IP}"
if [ "${NODE_TYPE}" = "device" ]; then
  export RVI_PORT="${RVI_PORT:-8900}"
  export RVI_BACKEND="${RVI_BACKEND:-$NODE_IP}"
  export RVI_BACKEND_PORT="${RVI_BACKEND_PORT:-8807}"
else
  export RVI_PORT="${RVI_PORT:-8800}"
fi

echo "RVI_MYIP=$RVI_MYIP"
echo "RVI_PORT=$RVI_PORT"
echo "RVI_BACKEND=$RVI_BACKEND"

/usr/bin/rvi_ctl -c $CONFIG console

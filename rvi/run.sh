#!/usr/bin/env bash

NODE_TYPE="${1:-server}"
NODE_IP=$(ip route | awk '/default/ { print $3 }')
CONFIGURATION="${CONFIGURATION:-rvi_${NODE_TYPE}.config}"

echo "node ip: $NODE_IP"
echo "configuration: $CONFIGURATION"

if ! test -f "$CONFIGURATION"; then
  echo "FATAL: Configuration $CONFIGURATION not found."
  exit 1
fi

export RVI_MYIP="${RVI_MYIP:-$NODE_IP}"

if test "$NODE_TYPE" = "client"; then
  export RVI_MY_NODE_ADDR="${RVI_MY_NODE_ADDR:-${NODE_IP}:8907}"
elif test "$NODE_TYPE" = "server"; then
  export RVI_MY_NODE_ADDR="${RVI_MY_NODE_ADDR:-${NODE_IP}:8807}"
fi

export RVI_BACKEND="${RVI_BACKEND:-${NODE_IP}}"

echo "my ip: $RVI_MYIP"
echo "my node addr: $RVI_MY_NODE_ADDR"
echo "backend: $RVI_BACKEND"

scripts/setup_rvi_node.sh -d -n "${NODE_TYPE}" -c "$CONFIGURATION"
scripts/rvi_node.sh -n "${NODE_TYPE}"


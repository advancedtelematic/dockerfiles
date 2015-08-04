#!/usr/bin/env bash

# "strict mode"
# see http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

NODE_TYPE="${1:-server}"
NODE_IP=$(ip route | awk '/default/ { print $3 }')
CONFIGURATION="${CONFIGURATION:-/rvi/rvi_${NODE_TYPE}.config}"

if ! test -f "$CONFIGURATION"; then
  echo "FATAL: Configuration $CONFIGURATION not found."
  exit 1
fi

sed -i "s/REPLACE_ME/$NODE_IP/" "$CONFIGURATION"
/rvi/scripts/setup_rvi_node.sh -d -n "${NODE_TYPE}" -c "$CONFIGURATION"
/rvi/scripts/rvi_node.sh -n "${NODE_TYPE}"


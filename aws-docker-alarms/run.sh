#!/bin/bash
# bash "strict mode", see
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

AWS=${AWS:-/usr/bin/aws}
NAMESPACE=${NAMESPACE:-System/Docker}
REGION=${REGION:-eu-west-1}
INST_ID=${INST_ID:-$(curl -s http://169.254.169.254/latest/meta-data/instance-id)}

die() {
  echo "$1"
  echo "Usage: $0 CONTAINER_ID"
  exit 1
}

metric() {
  CONTAINER=${1:-}

  if docker ps --filter=name=core | grep -i Up >/dev/null; then
    state=1
  else
    state=0
    echo "$CONTAINER is down!"
  fi

  $AWS cloudwatch put-metric-data \
    --region "$REGION" \
    --metric-name "Docker Container $CONTAINER status on $INST_ID" \
    --value "$state" \
    --dimensions InstanceId="$INST_ID" \
    --namespace "$NAMESPACE"
}

if test -z "$INST_ID"; then
  die "Couldn't get instance id from the aws api"
fi

for container in "$@"; do
  metric $container
done

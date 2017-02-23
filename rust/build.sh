#!/bin/bash

set -xeo pipefail


version=${1?"Usage: $0 <version> [<push=false]"}
push=${2:-false}

repo="advancedtelematic/rust"
archs=("x86" "armel" "armhf")

for arch in "${archs[@]}"; do
  tag="$repo:$arch-$version"
  [[ $version = 'nightly' ]] && tag+="-$(date -u +%Y-%m-%d)"

  docker build \
    --tag "$tag" \
    --build-arg arch="$arch" \
    --build-arg rustc_version="$version" \
    .

  [[ "$push" = true ]] && docker push "$tag"
done

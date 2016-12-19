#!/bin/bash

set -xeo pipefail


repo="advancedtelematic/rust"
archs=("x86" "armel" "armhf")
versions=("stable" "nightly" "1.10.0")
push=${1:-false}


function build {
  version=$1
  arch=$2

  docker build \
    --tag "$repo:$arch-$version" \
    --build-arg rustc_version="$version" \
    --build-arg arch="$arch" \
    .

  if [[ "$push" = true ]]; then
    docker push "$repo:$arch-$version"
  fi
}


for version in "${versions[@]}"; do
  for arch in "${archs[@]}"; do
    build "$version" "$arch"
  done
done


docker tag "$repo:x86-stable" "$repo:latest"
if [[ "$push" = true ]]; then
  docker push "$repo:latest";
fi

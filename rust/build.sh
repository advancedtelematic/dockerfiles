#!/bin/bash

set -xeo pipefail


repo="advancedtelematic/rust"
archs=("x86" "armel" "armhf")
versions=("stable" "1.10.0" "1.12.1")


function build {
  version=$1
  arch=$2

  docker build \
    --tag "$repo:$arch-$version" \
    --build-arg rustc_version="$version" \
    --build-arg arch="$arch" \
    .

  docker push "$repo:$arch-$version"
}


for version in "${versions[@]}"; do
  for arch in "${archs[@]}"; do
    build "$version" "$arch"
  done
done


docker tag "$repo:x86-stable" "$repo:latest"
docker push "$repo:latest"

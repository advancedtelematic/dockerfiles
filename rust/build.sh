#!/bin/bash

set -eo pipefail


repo="advancedtelematic/rust"
archs=("x86" "armel" "armhf")
rust_vers=("1.12.1" "stable")


function build {
  rustc_version=$1
  arch=$2

  docker build \
    --tag "$repo:$arch-$rustc_version" \
    --build-arg rustc_version="$rustc_version" \
    --build-arg arch="$arch" \
    .

  docker push "$repo:$arch-$rustc_version"
}


for rust_ver in "${rust_vers[@]}"; do
  for arch in "${archs[@]}"; do
    build "$rust_ver" "$arch"
  done
done


docker tag "$repo:x86-stable" "$repo:latest"
docker push "$repo:latest"

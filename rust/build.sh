#!/bin/bash

set -xeuo pipefail

version=${1?"Usage: $0 <version> [<upload=false>] [<no-cache=false>]"}
upload=${2:-false}
nocache=${3:-false}

repo="advancedtelematic/rust"
archs=("x86" "armel" "armhf")

for arch in "${archs[@]}"; do
  tag="$repo:$arch-$version"
  [[ $version = 'nightly' ]] && tag+="-$(date -u +%Y-%m-%d)"

  docker build \
    --tag "$tag" \
    --build-arg arch="$arch" \
    --build-arg rustc_version="$version" \
    $(eval [[ "$nocache" = true ]] && echo " --no-cache ") \
    .

  [[ "$upload" = true ]] && docker push "$tag"
done

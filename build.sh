#!/bin/bash
set -e

ROOT_DIR="$(cd "$(dirname "$0")/" >/dev/null 2>&1 || exit ;  pwd -P)"


repository=jacksonbicalho/setup-enviroment

version=$1
distro=$2
variant=$3
context="$version/$distro/$variant"
tag="$version-shellspec-kcov-$variant"

echo | cat "$ROOT_DIR/docker-entrypoint.txt" > "$context/docker-entrypoint.sh"


docker build --no-cache  \
"$context" -t "$repository:$tag"

rm -f "$context/docker-entrypoint.sh"

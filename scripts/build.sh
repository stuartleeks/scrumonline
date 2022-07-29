#!/bin/bash
set -e

build_args=$()

if [[ -n "$CI" ]]; then
	# Force plain output in CI for readability
	build_args+=(--progress plain)
fi

echo ${build_args[@]} | xargs docker build -t "${IMAGE_NAME}" -f Dockerfile  .

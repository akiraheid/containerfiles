#!/bin/bash
set -ex
IMAGE=$1
([ -f "${IMAGE}/printVersion.sh" ] && bash "${IMAGE}/printVersion.sh" "${IMAGE}") \
	|| podman run --rm "localhost/${IMAGE}" --version | head -n 1 | sed 's/[^0-9.]*\([0-9.]*\).*/\1/'

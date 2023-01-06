#!/bin/bash
set -e

IMAGE="$1"
if [ -f "${IMAGE}/build.sh" ]; then
	cd ${IMAGE}
	bash build.sh
else
	podman build -t localhost/${IMAGE}:latest --no-cache ${IMAGE}
fi

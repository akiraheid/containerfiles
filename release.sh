#!/bin/bash
set -ex

IMAGE=$1

if [ ! -f "${IMAGE}/Dockerfile" ]; then
	echo "No Dockerfile in ${IMAGE}, no image to release. Skipping"
	exit 0
fi

VERSION=$(bash printVersion.sh "${IMAGE}")

if [ -f "${IMAGE}/release.sh" ]; then
	cd "${IMAGE}"
	bash release.sh "${IMAGE}" "${VERSION}"
else
	# Intentionally expanding spaces to enter multiple items into the array
	# shellcheck disable=SC2206
	VERSION=(${VERSION//./ })

	TMP=
	for ver in "${VERSION[@]}"; do
		TMP="$TMP$ver"
		NAME="docker.io/akiraheid/$IMAGE:$TMP"
		podman tag "localhost/$IMAGE" "$NAME"
		podman push "$NAME"
		podman rmi "$NAME"
		TMP="$TMP."
	done
	NAME="docker.io/akiraheid/$IMAGE:latest"
	podman tag "localhost/$IMAGE:latest" "$NAME"
	podman push "$NAME"
	podman rmi "localhost/$IMAGE"
fi

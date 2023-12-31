#!/bin/bash
set -ex

IMAGE="$1"
VERSION=`bash printVersion.sh ${IMAGE}`

if [ -f ${IMAGE}/release.sh ]; then
	cd ${IMAGE}
	bash release.sh ${IMAGE} ${VERSION}
else
	VERSION=`echo ${VERSION} | sed 's/\./ /g'`
	VERSION=($VERSION)
	echo $VERSION

	TMP=
	for ver in ${VERSION[@]}; do
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

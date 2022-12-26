#!/bin/bash
set -ex

IMAGE=$1
VERSION=$2

VER_PARTS=`echo ${VERSION} | sed 's/\./ /g'`
VER_PARTS=($VER_PARTS)

echo "Release image..."
TMP=
for ver in ${VER_PARTS[@]}; do
	TMP="$TMP$ver"
	NAME="docker.io/akiraheid/$IMAGE:$TMP"
	podman tag "localhost/$IMAGE:latest" "$NAME"
	podman push "$NAME"
	TMP="$TMP."
done
NAME="docker.io/akiraheid/$IMAGE:latest"
podman tag "localhost/$IMAGE:latest" "$NAME"
podman push "$NAME"
echo "Release image... done"

echo "Release tool images..."
tools=(base calc draw impress math writer)
for i in "${tools[@]}"; do
	TMP=
	TOOL=$IMAGE-$i
	for ver in ${VER_PARTS[@]}; do
		TMP="$TMP$ver"
		NAME="docker.io/akiraheid/$TOOL:$TMP"
		podman tag "localhost/$TOOL:latest" "$NAME"
		podman push "$NAME"
		TMP="$TMP."
	done
	NAME="docker.io/akiraheid/$TOOL:latest"
	podman tag "localhost/$TOOL:latest" "$NAME"
	podman push "$NAME"
done
echo "Release tool images... done"

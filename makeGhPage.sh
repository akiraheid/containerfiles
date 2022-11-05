#!/bin/bash
# Generate the gh-pages files.
# If no argument, generate the main page. Otherwise, generate the page for the
# specified image.

set -ex

TRIVY_CACHE_VOL=trivy-cache

if [ $# == 0 ]; then
	echo main page
	echo "Cleanup database caches"
	set +e
	podman volume exists $TRIVY_CACHE_VOL && podman volume rm $TRIVY_CACHE_VOL
	set -e
else
	# Cache the Trivy database in a volume to delete at the end
	podman volume exists $TRIVY_CACHE_VOL || podman volume create $TRIVY_CACHE_VOL

	# Create a directory with the image archive to mount into the scanners
	# because podman mounts files as directories
	IMAGE=$1
	mkdir -p images pages
	podman save -o images/$IMAGE.tar localhost/$IMAGE
	ARCHIVE=$IMAGE.tar

	echo "Scanning $IMAGE"
	echo "... with Trivy"
	TRIVY=docker.io/aquasec/trivy:0.34.0
	podman pull $TRIVY
	podman run --rm \
		-v $TRIVY_CACHE_VOL:/root/.cache/:rw \
		-v $PWD/images/:/root/images/ \
		$TRIVY image --format sarif -o /root/images/trivy.json --input /root/images/$ARCHIVE

	podman run --rm \
		-v $PWD/makeMd.py:/root/makeMd.py \
		-v $PWD/pages/:/root/pages/ \
		-v $PWD/images/:/root/images/ \
		-w /root/ \
		docker.io/library/python:3-alpine python3 makeMd.py --format sarif -o /root/pages/$IMAGE.md images/trivy.json

	#echo "... with ClamAV"
	#CLAMAV=docker.io/clamav/clamav:0.105
	#podman pull $CLAMAV
	#podman run \
	#	--rm \
	#	-v $PWD/images/:/root/images/ \
	#	$CLAMAV /root/images/$ARCHIVE

	#rm -rf images
fi

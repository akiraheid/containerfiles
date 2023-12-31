#!/bin/bash
set -e

IMAGE=$1
desktop=$IMAGE.desktop

if [ -f "$desktop" ] && ! grep "/tmp/.X11-unix" $desktop ; then
	echo "ERR $desktop specifies a graphical display but there is no .desktop file."
	exit 1
fi

if [ -f "${IMAGE}/build.sh" ]; then
	cd "${IMAGE}"
	bash build.sh
else
	podman build -t localhost/"${IMAGE}":latest --no-cache "${IMAGE}"
fi

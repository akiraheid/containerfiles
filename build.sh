#!/bin/bash
set -e

app=$1

cd "$app"
if [ ! -f "Dockerfile" ]; then
	echo "No Dockerfile. Nothing to build."
	exit 0
fi

desktop=$app.desktop
if [ ! -f "$desktop" ] && grep "x11docker" "$app" ; then
	echo "ERR $app specifies a graphical display but there is no .desktop file."
	exit 1
fi

if [ -f "./build.sh" ]; then
	./build.sh
else
	podman build -t "localhost/${app}:latest" --no-cache .
fi

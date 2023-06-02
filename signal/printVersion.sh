podman run --rm --entrypoint /usr/bin/apt-cache "$1" showpkg signal-desktop | grep "(/var/lib/dpkg/status)" | cut -d " " -f 1

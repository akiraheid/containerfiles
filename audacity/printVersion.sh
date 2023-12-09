podman run --rm --entrypoint /usr/bin/apt-cache "$1" showpkg audacity | grep "(/var/lib/dpkg/status)" | cut -d "+" -f 1

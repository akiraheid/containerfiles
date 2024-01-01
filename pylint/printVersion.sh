podman run --rm "$1" --version | grep 'pylint' | cut -d " " -f 2

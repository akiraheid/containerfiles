podman run --rm "$1" --version | grep "black" | cut -d " " -f 2

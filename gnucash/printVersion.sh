podman run --rm "$1" --version | grep "this is" | cut -d " " -f 4

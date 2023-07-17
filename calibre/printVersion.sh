podman run --rm "$1" --version | cut -d " " -f 3 | cut -d ")" -f 1

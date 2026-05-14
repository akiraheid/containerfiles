podman run --rm "$1" --version | grep "LibreOffice" | cut -d " " -f 2

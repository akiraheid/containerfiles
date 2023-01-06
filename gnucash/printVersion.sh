podman run --rm --entrypoint gnucash-cli "$1" --version | grep "GnuCash" | cut -d " " -f 2

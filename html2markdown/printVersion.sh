#!/bin/bash
podman run --rm "$1" --version | grep "Version" | xargs | cut -d " " -f 2

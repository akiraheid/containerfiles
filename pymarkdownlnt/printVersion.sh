#!/usr/bin/env bash
podman run --rm "$1" version | cut -d " " -f 2

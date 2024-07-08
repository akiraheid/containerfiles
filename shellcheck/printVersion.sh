#!/bin/bash

podman run --rm "$1" --version | grep "version: " | cut -d " " -f 2

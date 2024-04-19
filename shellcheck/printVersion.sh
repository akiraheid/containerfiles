#!/bin/bash

podman run "$1" --version | grep "version: " | cut -d " " -f 2

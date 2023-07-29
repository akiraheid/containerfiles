#!/bin/sh
set -e

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

mkdir -p $XDG_CACHE_HOME $XDG_CONFIG_HOME $XDG_DATA_HOME

#hexdump -vn 16 -e'4/4 "%08x" 1 ""' /dev/urandom > /etc/machine-id

rhythmbox $@

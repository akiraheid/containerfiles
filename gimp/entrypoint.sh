#!/bin/sh

# Make temporary machine-id for container dbus
dbus-uuidgen --ensure

gimp "$@"

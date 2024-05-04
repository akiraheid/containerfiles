FROM docker.io/library/alpine:3
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

RUN apk add --no-cache --no-progress dbus dbus-x11 gimp font-freefont iso-codes

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

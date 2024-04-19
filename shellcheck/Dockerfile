FROM docker.io/library/alpine:3 AS downloader
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

RUN apk add --no-cache --no-progress shellcheck

ENTRYPOINT ["shellcheck"]

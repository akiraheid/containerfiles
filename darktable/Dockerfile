FROM alpine:3
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

COPY ./decoap/ /decoap/

RUN apk add --no-cache --no-progress darktable

ENTRYPOINT ["darktable"]

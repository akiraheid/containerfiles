FROM alpine:3
LABEL maintainer "akiraheid <https://github.com/akiraheid/oci-gimp>"

COPY ./decoap/ /decoap/

RUN apk add --no-cache --no-progress gimp

ENTRYPOINT ["gimp"]

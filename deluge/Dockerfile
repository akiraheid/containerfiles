FROM alpine:3
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

RUN apk add --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
	--no-cache \
	--no-progress \
	adwaita-icon-theme \
	deluge \
	gtk+3.0 \
	py3-setuptools

COPY ./decoap/ /decoap/

ENTRYPOINT ["deluge"]

FROM alpine:3
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

RUN apk add \
	--no-cache \
	--no-progress \
	adwaita-icon-theme \
	deluge \
	deluge-gtk \
	gtk+3.0

ENTRYPOINT ["deluge"]

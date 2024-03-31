FROM docker.io/library/alpine:3
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

RUN apk add --no-cache -v --no-progress \
	keepassxc \
	ttf-dejavu

ENTRYPOINT ["keepassxc"]

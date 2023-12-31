FROM docker.io/library/node:current-alpine
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

RUN npm install -g --production --remove-dev eslint \
	&& ln -s /usr/local/lib/node_modules/.bin/eslint /usr/bin/eslint

WORKDIR /mnt
ENTRYPOINT ["eslint"]
CMD ["--help"]

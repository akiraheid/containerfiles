FROM docker.io/library/node:current-alpine

RUN npm install -g --production --remove-dev prettier \
	&& ln -s /usr/local/lib/node_modules/.bin/prettier /usr/bin/prettier

WORKDIR /mnt
ENTRYPOINT ["prettier"]

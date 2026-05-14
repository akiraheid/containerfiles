FROM docker.io/library/ubuntu:24.04
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

RUN apt-get update \
	&& apt-get install -y \
		libreoffice \
	&& apt-get autoclean

ENTRYPOINT ["libreoffice"]

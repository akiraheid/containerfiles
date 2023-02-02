FROM docker.io/library/ubuntu:22.04
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

RUN apt-get update \
	&& apt-get install -y gnucash

COPY ./decoap/ /decoap/

ENTRYPOINT ["gnucash"]

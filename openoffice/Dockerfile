FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

COPY office.tar.gz office.tar.gz

RUN apt-get update \
	&& apt-get -y install default-jre \
	&& tar -xvzf office.tar.gz \
	&& rm office.tar.gz \
	&& cd en-US/DEBS \
	&& dpkg -i *.deb \
	&& cd / \
	&& rm -r en-US

COPY ./decoap/ decoap

ENTRYPOINT ["/opt/openoffice4/program/soffice"]

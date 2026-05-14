FROM docker.io/library/debian:13-slim
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

RUN apt-get update \
	&& apt-get install -y gnucash \
	&& apt-get autoclean

ENTRYPOINT ["gnucash"]

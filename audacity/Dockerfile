FROM docker.io/library/debian:12-slim

RUN apt-get update \
	&& apt-get install -y --no-install-recommends audacity gtk+3.0 \
	&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["audacity"]

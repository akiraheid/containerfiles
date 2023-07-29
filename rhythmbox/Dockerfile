FROM docker.io/library/ubuntu:22.04
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

RUN apt-get update && apt-get install -y --no-install-recommends \
		libcanberra-gtk3-module rhythmbox

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

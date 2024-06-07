FROM debian:12-slim
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		dbus dbus-x11 \
		libgl1-mesa-dri \
		libgl1-mesa-glx \
		vlc \
	&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "vlc" ]

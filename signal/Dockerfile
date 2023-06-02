FROM docker.io/library/ubuntu:22.04
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

# signal-desktop depends on librm2 but does not install it
RUN apt-get update \
	&& apt-get install -y wget gpg libdrm2 \
	&& wget -O - https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg \
	&& cat signal-desktop-keyring.gpg | tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null \
	&& echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' | tee /etc/apt/sources.list.d/signal-xenial.list \
	&& apt-get update && apt-get -y install signal-desktop

#COPY ./decoap/ /decoap/
#
#ENTRYPOINT ["gnucash"]

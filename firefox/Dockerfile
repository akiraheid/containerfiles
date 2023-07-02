FROM docker.io/library/ubuntu:22.04
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

# Thanks to https://askubuntu.com/a/1404401 for installing Firefox as a deb
# instead of a snap.
RUN apt update \
	&& apt-get install -y software-properties-common \
	&& add-apt-repository ppa:mozillateam/ppa \
	&& echo 'Package: *\nPin: release o=LP-PPA-mozillateam\nPin-Priority: 1001\n' > /etc/apt/preferences.d/mozilla-firefox \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y ubuntu-restricted-extras firefox

ENTRYPOINT ["firefox"]

# Download the obsidian DEB
FROM docker.io/library/alpine:3 as downloader

RUN OBSIDIAN_VERSION=$(wget -O - "https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest" | grep 'tag_name' | cut -d '"' -f 4) \
	&& echo "Downloading DEB" \
	&& wget -q -O /tmp/obsidian.deb \
		"https://github.com/obsidianmd/obsidian-releases/releases/download/${OBSIDIAN_VERSION}/Obsidian_$(echo ${OBSIDIAN_VERSION} | sed 's/v//g')_amd64.deb"

# The final image
FROM docker.io/library/debian:12-slim

COPY --from=downloader /tmp/obsidian.deb /tmp/obsidian.deb

RUN DEBIAN_FRONTEND=noninteractive \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends \
		libasound2-dev \
		libdrm-dev \
		libgbm-dev \
		qmmp \
		/tmp/obsidian.deb \
	&& apt-get autoclean \
	&& rm -rf \
		/var/lib/apt/lists/* \
		/var/tmp/* \
		/tmp/*

ENTRYPOINT ["obsidian"]

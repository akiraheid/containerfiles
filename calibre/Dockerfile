FROM docker.io/library/alpine:3 AS downloader
RUN wget --no-verbose -O /app.txz https://github.com/kovidgoyal/calibre/releases/download/v6.24.0/calibre-6.24.0-x86_64.txz

FROM docker.io/library/ubuntu:22.04
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

WORKDIR app

COPY --from=downloader /app.txz app.txz
RUN apt-get update && apt-get install -y --no-install-recommends fontconfig \
		fcitx-rime fonts-wqy-microhei libnss3 libopengl0 libqpdf28 \
		libxkbcommon-x11-0 libxkbfile1 libxcb-icccm4 libxcb-image0 \
		libxcb-keysyms1 libxcb-randr0 libxcb-render-util0 libxcb-xinerama0 \
		libxcomposite1 libxdamage1 libxrandr2 poppler-utils python3 python3-xdg \
		ttf-wqy-zenhei xz-utils \
	&& apt-get install -y speech-dispatcher \
	&& tar -xf app.txz && rm app.txz \
	&& apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ENV HOME=/home/calibre
RUN useradd --create-home --home-dir $HOME calibre \
	&& chown -R calibre:calibre $HOME \
	&& usermod -a -G audio,video calibre

WORKDIR $HOME
USER calibre

ENTRYPOINT ["/app/calibre"]

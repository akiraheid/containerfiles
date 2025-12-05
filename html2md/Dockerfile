FROM docker.io/library/alpine:3 as downloader

RUN version=1.7.0 \
	&& pkginfo=html2md_${version}_amd64_Ubuntu+noble \
	&& wget -O app.deb \
		"https://github.com/tim-gromeyer/html2md/releases/download/v${version}/${pkginfo}.deb"

FROM docker.io/library/ubuntu:24.04
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

COPY --from=downloader /app.deb /app.deb
RUN apt-get install -y "/app.deb" \
	&& rm /app.deb

ENV HOME /home/app
RUN useradd --create-home --home-dir $HOME app \
	&& chown -R app:app $HOME

WORKDIR $HOME
USER app

ENTRYPOINT ["html2md"]

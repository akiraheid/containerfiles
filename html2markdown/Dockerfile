FROM docker.io/library/alpine:3
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

ENV HOME /home/html2markdown
RUN addgroup -S html2markdown \
	&& adduser -S -G html2markdown -D -h $HOME html2markdown \
	&& chown -R html2markdown:html2markdown $HOME

# Separate RUN because this will constantly change
RUN mkdir -p /opt/html2markdown \
	&& cd /opt/html2markdown \
	&& wget -O app.tar.gz https://github.com/JohannesKaufmann/html-to-markdown/releases/download/v2.3.3/html-to-markdown_Linux_x86_64.tar.gz \
	&& tar -xf app.tar.gz \
	&& rm app.tar.gz \
	&& ln -s "$(pwd)/html2markdown" /usr/bin/html2markdown

WORKDIR $HOME
USER html2markdown

ENTRYPOINT ["html2markdown"]

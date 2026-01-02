FROM docker.io/library/alpine:3 AS downloader

RUN wget -O app.tgz \
		https://github.com/rust-mcp-stack/rust-mcp-filesystem/releases/download/v0.3.8/rust-mcp-filesystem-x86_64-unknown-linux-gnu.tar.gz \
	&& tar -xf app.tgz \
	&& mkdir -p /app \
	&& mv ./rust-mcp-filesystem-x86_64-unknown-linux-gnu/* /app/

FROM python:3-slim
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

COPY --from=downloader /app/* /opt/rust-mcp-filesystem/

RUN pip install mcpo==0.0.19 \
	&& ln -s /opt/rust-mcp-filesystem/rust-mcp-filesystem /usr/local/bin/rust-mcp-filesystem

ENTRYPOINT ["mcpo", "--port", "8080", "--", "rust-mcp-filesystem"]

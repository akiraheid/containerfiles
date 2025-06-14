FROM python:3-slim
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

RUN pip install black

ENV HOME /home/black
RUN useradd --create-home --home-dir $HOME black \
	&& chown -R black:black $HOME

WORKDIR $HOME
USER black

ENTRYPOINT ["black"]

FROM python:3-slim

RUN pip install black

ENV HOME /home/black
RUN useradd --create-home --home-dir $HOME black \
	&& chown -R black:black $HOME

WORKDIR $HOME
USER black

ENTRYPOINT ["black"]

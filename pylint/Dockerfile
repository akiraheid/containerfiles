FROM docker.io/library/python:3-alpine
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

RUN python3 -m pip install --no-cache-dir --no-compile pylint

WORKDIR /mnt
ENTRYPOINT ["pylint"]
CMD ["--help"]

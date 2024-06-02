# Install libtiff5, and libwebp6 so that it can be copied to the Calibre image to
# satisfy Qt. These packages are available on bullseye (11) and not bookworm (12).
FROM docker.io/library/debian:11 as oldpackages
RUN apt-get update && apt-get install -y libtiff5-dev libwebp6

FROM docker.io/library/python:3-slim-bookworm
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

# Install install script and calibre dependencies according to
# https://calibre-ebook.com/download_linux, script output, and
# https://www.mobileread.com/forums/showthread.php?t=333503
RUN apt-get update && apt-get install -y --no-install-recommends \
		fontconfig \
		libegl1 libglx0 libopengl0 \
		libnss3 libsm6 \
		libqt6pdf6 libjbig0 libdeflate0 \
		libxcb-cursor0 libxcomposite1 libxdamage1 libxkbcommon-x11-0 libxkbfile1 \
		libxrandr2 libxtst6 \
		xdg-utils xz-utils wget \
		libxcb-xinerama0 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-randr0 \
		libxcb-render-util0 libxcb-shape0 \
	&& wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh \
		| sh /dev/stdin

COPY --from=oldpackages /usr/lib/x86_64-linux-gnu/libtiff.so.5* /usr/lib/x86_64-linux-gnu/
COPY --from=oldpackages /usr/share/doc/libtiff5 /usr/share/doc/
COPY --from=oldpackages /usr/lib/x86_64-linux-gnu/libwebp.so.6* /usr/lib/x86_64-linux-gnu/
COPY --from=oldpackages /usr/share/doc/libwebp6 /usr/share/doc/

# Specified as required by the Calibre download page
# https://calibre-ebook.com/download_linux
ENV QT_QPA_PLATFORM=xcb

ENTRYPOINT ["calibre"]

GnuCash is personal and small-business financial-accounting software, freely licensed under the GNU GPL and available for GNU/Linux, BSD, Solaris, Mac OS X and Microsoft Windows.

Check out their [website](https://www.gnucash.org/) and consider donating to [GnuCash](https://gnucash.org/donate.phtml).

# Usage

```
podman run -d --rm \
	-e DISPLAY=unix${DISPLAY} \
	-e GNC_DATA_HOME=/root/.local/share/gnucash \
	-e GNC_CONFIG_HOME=/root/.config/gnucash \
	-v gnucash-share:/root/.local/share/gnucash/ \
	-v gnucash-config:/root/.config/gnucash/ \
	-v $HOME/Documents/gnucash/:/root/gnucash/ \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /usr/share/fonts/:/usr/share/fonts:ro \
	docker.io/akiraheid/gnucash:latest
```

# Source code

See the `Dockerfile` that makes this image [here](https://github.com/akiraheid/containerfiles).

See security findings for this image [here](https://akiraheid.github.io/containerfiles/).

# Donating

Consider [becoming a patron](https://www.patreon.com/akiracode) to keep this container updated.

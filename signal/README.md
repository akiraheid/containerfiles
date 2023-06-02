Signal is a state-of-the-art end-to-end encryption (powered by the open source Signal Protocol) keeps your conversations secure.

Check out their [website](https://signal.org/#signal) and consider [donating](https://signal.org/donate/).

# Usage

```
podman run -d --rm \
	-e DISPLAY=unix${DISPLAY} \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	docker.io/akiraheid/signal:latest
```

# Source code

See the `Dockerfile` that makes this image [here](https://github.com/akiraheid/containerfiles).

See security findings for this image [here](https://akiraheid.github.io/containerfiles/).

# Donating

Consider [becoming a patron](https://www.patreon.com/akiracode) to keep this container updated.

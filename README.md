A collection of software containers for use as desktop applications ("apps").

# Usage

## Requirements

### Environment

Add `~/.local/bin` to [`PATH`](https://superuser.com/a/284351).

### Container tool

Install a container runtime tool:

- [Docker](https://docs.docker.com/engine/install/)
- [Podman](https://podman.io/docs/installation)

### GUI support

Install [`x11docker`](https://github.com/mviereck/x11docker) to use apps with
GUIs (e.g. Firefox).

If you don't want to install `x11docker` for all users, copy `x11docker` to
[`~/.local/bin`](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html).

`x11docker` helps containerized applications display GUIs on the host. More
details at the [`x11docker` repository](https://github.com/mviereck/x11docker).

## Installing apps

Install an app with the install script.

    ./install gimp

Run the application like any other through the app menu or command line
interface (CLI).

    gimp

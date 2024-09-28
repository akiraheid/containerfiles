A collection of software containers for use as desktop applications ("apps").

# Requirements

Install a container runtime tool:

- [Docker](https://docs.docker.com/engine/install/)
- [Podman](https://podman.io/docs/installation)

## GUI apps

For apps with a graphical user interface (GUI), install
[`x11docker`](https://github.com/mviereck/x11docker).

If you don't want to install `x11docker` for all users, copy `x11docker` to
[`~/.local/bin`](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)
and make sure `~/.local/bin` is in [`PATH`](https://superuser.com/a/284351).

`x11docker` helps containerized applications display GUIs on the host. More
details at the [`x11docker` repository](https://github.com/mviereck/x11docker).

## CLI apps

Nothing else required.

# Usage

Install an application with the install script.

    ./install gimp

Run the application like any other throught the app menu or command line
interface (CLI).

    gimp

# Development

When creating a new image for an app, be sure to check
[Alpine](https://pkgs.alpinelinux.org/packages) and
[Debian](https://www.debian.org/distrib/packages) package repositories before
doing manual installs. Using the packages generally resolves most dependencies.

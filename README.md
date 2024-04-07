A collection of software containers for use as desktop applications.

# Usage

Install [`x11docker`](https://github.com/mviereck/x11docker).

`x11docker` helps containerized applications display GUIs on the host. More
details at the [`x11docker` repository](https://github.com/mviereck/x11docker).

If you don't want to install `x11docker` for all users, copy `x11docker` to
[`~/.local/bin`](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)
and make sure `~/.local/bin` is in [`PATH`](https://superuser.com/a/284351).

Install an application with the install script.

	./install gimp

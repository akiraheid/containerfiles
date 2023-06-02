FROM docker.io/library/ubuntu:22.04
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

# signal-desktop depends on libdrm2 but does not install it
# signal-desktop uses electron for its display

# Create a signal user so that process in container isn't root and we don't get
# the following error
# FATAL:electron_main_delegate.cc(294)] Running as root without --no-sandbox is not supported. See https://crbug.com/638180

# Other issues to fix
# Gtk-Message: 22:34:53.262: Failed to load module "canberra-gtk-module"
# MESA-LOADER: failed to open crocus: /usr/lib/dri/crocus_dri.so: cannot open shared object file: No such file or directory (search paths /usr/lib/x86_64-linux-gnu/dri:\$${ORIGIN}/dri:/usr/lib/dri, suffix _dri)
#MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so: cannot open shared object file: No such file or directory (search paths /usr/lib/x86_64-li
#nux-gnu/dri:\$${ORIGIN}/dri:/usr/lib/dri, suffix _dri)
#MESA-LOADER: failed to open kms_swrast: /usr/lib/dri/kms_swrast_dri.so: cannot open shared object file: No such file or directory (search paths /usr/l
#ib/x86_64-linux-gnu/dri:\$${ORIGIN}/dri:/usr/lib/dri, suffix _dri)
#MESA-LOADER: failed to open swrast: /usr/lib/dri/swrast_dri.so: cannot open shared object file: No such file or directory (search paths /usr/lib/x86_6
#4-linux-gnu/dri:\$${ORIGIN}/dri:/usr/lib/dri, suffix _dri)
#[1:1209/223501.886875:ERROR:bus.cc(399)] Failed to connect to the bus: Failed to connect to socket /run/dbus/system_bus_socket: No such file or direct
#ory
#[1:1209/223501.887040:ERROR:bus.cc(399)] Failed to connect to the bus: Failed to connect to socket /run/dbus/system_bus_socket: No such file or direct
#ory
#[1:1209/223501.887228:ERROR:bus.cc(399)] Failed to connect to the bus: Failed to connect to socket /run/dbus/system_bus_socket: No such file or direct
#ory
#[1:1209/223502.018018:ERROR:bus.cc(399)] Failed to connect to the bus: Could not parse server address: Unknown address type (examples of valid types a
#re "tcp" and on UNIX "unix")
#[1:1209/223504.391386:ERROR:bus.cc(399)] Failed to connect to the bus: Could not parse server address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
#[1:1209/223506.259291:ERROR:bus.cc(399)] Failed to connect to the bus: Could not parse server address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")
#[1:1209/223633.099770:ERROR:bus.cc(399)] Failed to connect to the bus: Could not parse server address: Unknown address type (examples of valid types are "tcp" and on UNIX "unix")

# Trying to use sticker causes this issue and fatal error
#(node:65) [DEP0005] DeprecationWarning: Buffer() is deprecated due to security and usability issues. Please use the Buffer.alloc(), Buffer.allocUnsafe(), or Buffer.from() methods instead.
#(Use `exe --trace-deprecation ...` to show where the warning was created)
#Render process is gone: Error: Reason: crashed, Exit Code: 5
#    at App.<anonymous> (/opt/Signal/resources/app.asar/app/global_errors.js:88:7)
#    at App.emit (node:events:525:35)
#    at WebContents.<anonymous> (node:electron/js2c/browser_init:2:90245)
#    at WebContents.emit (node:events:525:35)
RUN apt-get update \
	&& apt-get install -y wget gpg libdrm2 \
	&& wget -O - https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg \
	&& cat signal-desktop-keyring.gpg | tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null \
	&& echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |  tee /etc/apt/sources.list.d/signal-xenial.list \
	&& apt-get update && apt-get -y install signal-desktop

ENTRYPOINT ["/usr/bin/signal-desktop"]

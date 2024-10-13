FROM docker.io/library/debian:12-slim
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

# signal-desktop depends on libdrm2 but does not install it
# signal-desktop uses electron for its display

# Create a signal user so that process in container isn't root and we don't get
# the following error
# FATAL:electron_main_delegate.cc(294)] Running as root without --no-sandbox is not supported. See https://crbug.com/638180

# Log of issues to resolve
# Set Windows Application User Model ID (AUMID) { AUMID: 'org.whispersystems.signal-desktop' }
# NODE_ENV production
# NODE_CONFIG_DIR /opt/Signal/resources/app.asar/config
# NODE_CONFIG {}
# ALLOW_CONFIG_MUTATIONS undefined
# HOSTNAME efafedbe5943
# NODE_APP_INSTANCE undefined
# SUPPRESS_NO_CONFIG_WARNING undefined
# SIGNAL_ENABLE_HTTP undefined
# userData: /home/signal/.config/Signal
# config/get: Successfully read user config file
# config/get: Successfully read ephemeral config file
# [91:1012/162129.191935:WARNING:discardable_shared_memory_manager.cc(197)] Less than 64MB of free space in temporary directory for shared memory files: 62
# [91:1012/162129.192061:ERROR:bus.cc(407)] Failed to connect to the bus: Failed to connect to socket /run/dbus/system_bus_socket: No such file or directory
# LaunchProcess: failed to execvp:
# xdg-settings
# LaunchProcess: failed to execvp:
# xdg-settings
# [91:1012/162129.649143:ERROR:bus.cc(407)] Failed to connect to the bus: Failed to connect to socket /run/dbus/system_bus_socket: No such file or directory
# [91:1012/162129.649312:ERROR:bus.cc(407)] Failed to connect to the bus: Failed to connect to socket /run/dbus/system_bus_socket: No such file or directory
# Fontconfig error: No writable cache directories
# Fontconfig error: No writable cache directories
# Fontconfig error: No writable cache directories
# Fontconfig error: No writable cache directories
# [91:1012/162129.672112:WARNING:bluez_dbus_manager.cc(234)] Floss manager service not available, cannot set Floss enable/disable.
# [121:1012/162129.673816:WARNING:gpu_memory_buffer_support_x11.cc(49)] dri3 extension not supported.
# [121:1012/162129.674579:WARNING:sandbox_linux.cc(430)] InitializeSandbox() called with multiple threads in process gpu-process.
# [91:1012/162129.797223:ERROR:bus.cc(407)] Failed to connect to the bus: Failed to connect to socket /run/dbus/system_bus_socket: No such file or directory
# [91:1012/162129.797265:ERROR:bus.cc(407)] Failed to connect to the bus: Failed to connect to socket /run/dbus/system_bus_socket: No such file or directory
# [91:1012/162129.797281:ERROR:bus.cc(407)] Failed to connect to the bus: Failed to connect to socket /run/dbus/system_bus_socket: No such file or directory
# dbus-daemon[88]: [session uid=1000 pid=88] Activating service name='org.a11y.Bus' requested by ':1.3' (uid=1000 pid=91 comm="/opt/Signal/signal-desktop --no-sandbox ")
# dbus-daemon[163]: writing oom_score_adj error: Permission denied
# dbus-daemon[88]: [session uid=1000 pid=88] Successfully activated service 'org.a11y.Bus'
# [91:1012/162129.838271:WARNING:power_observer_linux.cc(181)] Failed to connect to PrepareForShutdown
# [91:1012/162129.838383:WARNING:power_observer_linux.cc(181)] Failed to connect to PrepareForSleep
# [91:1012/162129.838412:WARNING:power_observer_linux.cc(70)] org.freedesktop.login1 not available
# [91:1012/162130.309693:INFO:CONSOLE(2)] "The vm module of Node.js is deprecated in the renderer process and will be removed.", source: node:electron/js2c/renderer_init (2)
# [91:1012/162130.651839:INFO:CONSOLE(112)] "A preload for 'file:///opt/Signal/resources/app.asar/fonts/inter-v3.19/Inter-BoldItalic.woff2' is found, but is not used because the request credentials mode does not match. Consider taking a look at crossorigin attribute.", source: file:///opt/Signal/resources/app.asar/background.html (112)
# [91:1012/162130.651875:INFO:CONSOLE(112)] "A preload for 'file:///opt/Signal/resources/app.asar/fonts/inter-v3.19/Inter-Bold.woff2' is found, but is not used because the request credentials mode does not match. Consider taking a look at crossorigin attribute.", source: file:///opt/Signal/resources/app.asar/background.html (112)
# [91:1012/162130.651889:INFO:CONSOLE(112)] "A preload for 'file:///opt/Signal/resources/app.asar/fonts/inter-v3.19/Inter-SemiBoldItalic.woff2' is found, but is not used because the request credentials mode does not match. Consider taking a look at crossorigin attribute.", source: file:///opt/Signal/resources/app.asar/background.html (112)
# [91:1012/162130.651898:INFO:CONSOLE(112)] "A preload for 'file:///opt/Signal/resources/app.asar/fonts/inter-v3.19/Inter-Italic.woff2' is found, but is not used because the request credentials mode does not match. Consider taking a look at crossorigin attribute.", source: file:///opt/Signal/resources/app.asar/background.html (112)
# [91:1012/162130.651909:INFO:CONSOLE(112)] "A preload for 'file:///opt/Signal/resources/app.asar/fonts/inter-v3.19/Inter-SemiBold.woff2' is found, but is not used because the request credentials mode does not match. Consider taking a look at crossorigin attribute.", source: file:///opt/Signal/resources/app.asar/background.html (112)
# [91:1012/162130.651927:INFO:CONSOLE(112)] "A preload for 'file:///opt/Signal/resources/app.asar/fonts/inter-v3.19/Inter-Medium.woff2' is found, but is not used because the request credentials mode does not match. Consider taking a look at crossorigin attribute.", source: file:///opt/Signal/resources/app.asar/background.html (112)
# [91:1012/162130.651938:INFO:CONSOLE(112)] "A preload for 'file:///opt/Signal/resources/app.asar/fonts/inter-v3.19/Inter-Regular.woff2' is found, but is not used because the request credentials mode does not match. Consider taking a look at crossorigin attribute.", source: file:///opt/Signal/resources/app.asar/background.html (112)
# [91:1012/162130.651948:INFO:CONSOLE(112)] "A preload for 'file:///opt/Signal/resources/app.asar/fonts/inter-v3.19/Inter-BoldItalic.woff2' is found, but is not used because the request credentials mode does not match. Consider taking a look at crossorigin attribute.", source: file:///opt/Signal/resources/app.asar/background.html (112)
# [91:1012/162130.651959:INFO:CONSOLE(112)] "A preload for 'file:///opt/Signal/resources/app.asar/fonts/inter-v3.19/Inter-Bold.woff2' is found, but is not used because the request credentials mode does not match. Consider taking a look at crossorigin attribute.", source: file:///opt/Signal/resources/app.asar/background.html (112)
# [91:1012/162130.651971:INFO:CONSOLE(112)] "A preload for 'file:///opt/Signal/resources/app.asar/fonts/inter-v3.19/Inter-SemiBoldItalic.woff2' is found, but is not used because the request credentials mode does not match. Consider taking a look at crossorigin attribute.", source: file:///opt/Signal/resources/app.asar/background.html (112)
# [91:1012/162130.651985:INFO:CONSOLE(112)] "A preload for 'file:///opt/Signal/resources/app.asar/fonts/inter-v3.19/Inter-Italic.woff2' is found, but is not used because the request credentials mode does not match. Consider taking a look at crossorigin attribute.", source: file:///opt/Signal/resources/app.asar/background.html (112)
# [91:1012/162130.651994:INFO:CONSOLE(112)] "A preload for 'file:///opt/Signal/resources/app.asar/fonts/inter-v3.19/Inter-SemiBold.woff2' is found, but is not used because the request credentials mode does not match. Consider taking a look at crossorigin attribute.", source: file:///opt/Signal/resources/app.asar/background.html (112)
# [91:1012/162130.652005:INFO:CONSOLE(112)] "A preload for 'file:///opt/Signal/resources/app.asar/fonts/inter-v3.19/Inter-Medium.woff2' is found, but is not used because the request credentials mode does not match. Consider taking a look at crossorigin attribute.", source: file:///opt/Signal/resources/app.asar/background.html (112)
# [91:1012/162130.652014:INFO:CONSOLE(112)] "A preload for 'file:///opt/Signal/resources/app.asar/fonts/inter-v3.19/Inter-Regular.woff2' is found, but is not used because the request credentials mode does not match. Consider taking a look at crossorigin attribute.", source: file:///opt/Signal/resources/app.asar/background.html (112)
# Render process is gone: Error: Reason: crashed, Exit Code: 5
#     at App.<anonymous> (/opt/Signal/resources/app.asar/app/global_errors.js:94:7)
#     at App.emit (node:events:519:28)
#     at WebContents.<anonymous> (node:electron/js2c/browser_init:2:87106)
#     at WebContents.emit (node:events:519:28)
# Renderer process crashed - see https://www.electronjs.org/docs/tutorial/application-debugging for potential debugging information.

RUN apt-get update \
	&& apt-get install -y wget gpg libdrm2 \
	&& wget -O - https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg \
	&& cat signal-desktop-keyring.gpg | tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null \
	&& echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |  tee /etc/apt/sources.list.d/signal-xenial.list \
	&& apt-get update \
	&& apt-get -y install signal-desktop dbus

ENV HOME /home/signal
RUN useradd --create-home --home-dir $HOME signal \
	&& chown -R signal:signal $HOME \
	&& usermod -a -G audio,video signal

WORKDIR $HOME
USER signal

ENTRYPOINT ["signal-desktop"]

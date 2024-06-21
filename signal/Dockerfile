FROM docker.io/library/ubuntu:22.04
LABEL maintainer "akiraheid <https://github.com/akiraheid/containerfiles>"

# signal-desktop depends on libdrm2 but does not install it
# signal-desktop uses electron for its display

# Create a signal user so that process in container isn't root and we don't get
# the following error
# FATAL:electron_main_delegate.cc(294)] Running as root without --no-sandbox is not supported. See https://crbug.com/638180

# Other issues to fix
#[91:0621/135300.474242:ERROR:bus.cc(407)] Failed to connect to the bus: Failed to connect to socket /run/dbus/system_bus_socket: No such file or directory
#LaunchProcess: failed to execvp:
#xdg-settings
#LaunchProcess: failed to execvp:
#xdg-settings
#[91:0621/135300.929104:ERROR:bus.cc(407)] Failed to connect to the bus: Failed to connect to socket /run/dbus/system_bus_socket: No such file or directory
#[91:0621/135300.952131:ERROR:bus.cc(407)] Failed to connect to the bus: Failed to connect to socket /run/dbus/system_bus_socket: No such file or directory
#Fontconfig error: No writable cache directories
#Fontconfig error: No writable cache directories
#Fontconfig error: No writable cache directories
#Fontconfig error: No writable cache directories
#[91:0621/135301.059435:ERROR:bus.cc(407)] Failed to connect to the bus: Failed to connect to socket /run/dbus/system_bus_socket: No such file or directory
#[91:0621/135301.059479:ERROR:bus.cc(407)] Failed to connect to the bus: Failed to connect to socket /run/dbus/system_bus_socket: No such file or directory
#[91:0621/135301.059498:ERROR:bus.cc(407)] Failed to connect to the bus: Failed to connect to socket /run/dbus/system_bus_socket: No such file or directory
#dbus-daemon[88]: [session uid=1000 pid=88] Activating service name='org.a11y.Bus' requested by ':1.3' (uid=1000 pid=91 comm="/opt/Signal/signal-desktop --no-sandbox ")
#dbus-daemon[163]: writing oom_score_adj error: Permission denied

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

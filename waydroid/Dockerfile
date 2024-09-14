FROM docker.io/library/debian:12-slim

# kmod provides modprobe that waydroid wants
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		ca-certificates curl \
		dbus \
		kmod \
	&& curl https://repo.waydro.id | bash \
	&& apt-get install -y --no-install-recommends waydroid \
	&& waydroid init \
	&& rm -rf /var/lib/apt/lists/*

# Facing issue
# Setting up waydroid (1.4.3) ...
# ERROR: WayDroid is not initialized, run &quot;waydroid init&quot;
# Created symlink /etc/systemd/system/multi-user.target.wants/waydroid-container.service → /lib/systemd/system/waydroid-container.ser
# vice.
# [03:01:41] Failed to load binder driver
# [03:01:41] modprobe: FATAL: Module binder_linux not found in directory /lib/modules/6.8.0-40-generic
# [03:01:41] ERROR: Binder node &quot;binder&quot; for waydroid not found
# [03:01:41] See also: &lt;https://github.com/waydroid&gt;
# Run &apos;waydroid log&apos; for details.
# Error: error building at STEP &quot;RUN apt-get update       &amp;&amp; apt-get install -y --no-install-recommends           curl ca-certificate
# s dbus          kmod    &amp;&amp; curl https://repo.waydro.id | bash   &amp;&amp; apt-get install -y --no-install-recommends waydroid  &amp;&amp; waydroid
#  init   &amp;&amp; rm -rf /var/lib/apt/lists/*&quot;: error while running runtime: exit status 1
# make: *** [Makefile:55: waydroid] Error 125</pre>

COPY ./entrypoint.sh /bin/entrypoint

ENTRYPOINT ["entrypoint"]

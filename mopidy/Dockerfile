FROM debian:buster-slim

# Set non interactive during build
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Amsterdam

RUN apt-get update && apt-get full-upgrade

# Install general pacakges
RUN apt-get update && \
			apt-get install -y \
			wget \
			curl \
			git \
			apt-utils \
			python3 \
			python3-pip \
			python3-dev

# 1 Add archive GPG Key
RUN wget -q -O - https://apt.mopidy.com/mopidy.gpg | apt-key add -
# 2 Add APT repo to package sources
RUN wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/buster.list

# 3 Install Mopidy
RUN apt-get update
RUN apt-get install -y mopidy

RUN apt-get update
RUN apt install -y mopidy-mpd mopidy-spotify

# Requires this?
RUN apt install -y gstreamer1.0-alsa

RUN python3 -m pip install requests -U

RUN apt-get install -y \
	gstreamer1.0-plugins-bad

RUN python3 -m pip install Mopidy-Iris
RUN python3 -m pip install Mopidy-Youtube
RUN python3 -m pip install Mopidy-YTMusic

##  Copy fallback configuration.
COPY mopidy.conf /etc/default/mopidy.conf

#  Copy default configuration.
COPY mopidy.conf /etc/mopidy/mopidy.conf

# Copy helper script.
COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

VOLUME ["/data", "/cache"]

#EXPOSE 6600 6680 5555/udp
EXPOSE 6600 6680

# USER mopidy

ENTRYPOINT ["/entrypoint.sh"]

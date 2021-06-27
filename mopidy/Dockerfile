FROM debian:buster-slim

ENV TZ=Europe/Amsterdam

# WORKDIR /home/user/mopidy-multi

# Official Mopidy install for Debian/Ubuntu along with some extensions
# (see https://docs.mopidy.com/en/latest/installation/debian/ )
# RUN apt update \
#  && apt-get install -y wget \ gnupg2 \
#  && wget -q -O - https://apt.mopidy.com/mopidy.gpg | apt-key add - \
#  && wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/buster.list


RUN apt-get update && apt-get full-upgrade

# Install general pacakges
RUN apt-get update \
			&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
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
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mopidy

RUN apt-get update

# Install Mopidy/Snapcast + some extensions dependencies


# RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
# 	libspotify12 \
# 	libspotify-dev

# RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
# 	mopidy-mpd \
# 	mopidy-spotify


RUN apt install -y mopidy-mpd mopidy-spotify
RUN apt install -y gstreamer1.0-alsa
# 4 Install all the Mopidy extensions
#COPY requirements.txt requirements.txt
# RUN pip3 install -r requirements.txt \
#  && rm -rf ~/.cache/pip

RUN python3 -m pip install requests -U

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
	gstreamer1.0-plugins-bad

RUN python3 -m pip install Mopidy-Iris
RUN python3 -m pip install Mopidy-Youtube
RUN python3 -m pip install Mopidy-YTMusic



# RUN update-ca-certificates --fresh


# 
# COPY mopidy.conf /root/.config/mopidy/
# COPY mopidy.conf /etc/mopidy
# Default configuration.

##  Copy fallback configuration.
COPY mopidy.conf /etc/default/mopidy.conf

#  Copy default configuration.
COPY mopidy.conf /etc/mopidy/mopidy.conf


# COPY mopidy.conf ~/.config/mopidy/mopidy.conf 

# VOLUME ["/root/.cache/mopidy", "/root/.local/share/mopidy"]
# VOLUME ["/etc/mopidy", "/root/.local/share/mopidy"]


# COPY mopidy.conf /root/.config/mopidy/

# VOLUME ["/root/.cache/mopidy", "/root/.local/share/mopidy"]


# ADD mopidy.conf /etc/mopidy.conf

# ADD entrypoint.sh /entrypoint.sh

# RUN chown mopidy:audio -R /var/lib/mopidy \
#     && chown mopidy:audio /entrypoint.sh

# ADD localscan /usr/bin/localscan
# RUN chmod +x /usr/bin/localscan

# RUN chmod +x /entrypoint.sh

# VOLUME /var/lib/mopidy


# RUN service enable mopidy


# Copy helper script.
COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

VOLUME ["/data", "/cache"]

#EXPOSE 6600 6680 5555/udp
EXPOSE 6600 6680

USER mopidy

ENTRYPOINT ["/entrypoint.sh"]

# ENTRYPOINT ["/entrypoint.sh"]
# CMD ["/usr/bin/mopidy", "--config", "/etc/mopidy.conf:/mopidy.conf"]

# ENTRYPOINT ["mopidy --config /etc/mopidy/mopidy.conf"]
# ENTRYPOINT ["mopidy", "--config", "/etc/mopidy/mopidy.conf"]
# ENTRYPOINT ["mopidy"]
# ENTRYPOINT ["/bin/sh"]ENV name Darwin
# ENTRYPOINT ["/bin/bash", “-c” "echo Welcome, Cclient"]
# CMD ["ping","localhost"]
# ENTRYPOINT ["service start mopidy"]
# CMD ["/usr/bin/mopidy", ]
# CMD ["--config", "/etc/mopidy/mopidy.conf"]
# CMD ["--config", "/root/.config/mopidy/"]
# CMD ["service enable /usr/bin/mopidy", "service start /usr/bin/mopidy"]

# apt-get install mopidy-mpd
# apt-get install mopidy-spotify
# python3 -m pip install Mopidy-Youtube
# python3 -m pip install Mopidy-YTMusic
# pip3 install Mopidy-WebSettings
# python3 -m pip install Mopidy-Iris
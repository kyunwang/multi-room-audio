FROM balenalib/raspberry-pi-debian:latest

WORKDIR /data
ARG SNAPCAST_VERSION
# Set non interactive during build
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get full-upgrade

RUN apt-get install -y bash
RUN apt-get install -y libasound2-dev libpulse-dev libvorbisidec-dev libvorbis-dev libopus-dev libflac-dev libsoxr-dev alsa-utils libavahi-client-dev avahi-daemon libexpat1-dev

RUN apt-get update \
  && apt-get install -y wget ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# RUN  wget https://github.com/badaix/snapcast/releases/download/v${snapcast_version}/snapclient_${snapcast_version}-1_$(echo $TARGETARCH | sed 's/arm/armhf/g')armhf.deb
# RUN wget https://github.com/badaix/snapcast/releases/download/v${SNAPCAST_VERSION}/snapserver_${SNAPCAST_VERSION}-1_$(echo $TARGETARCH | sed 's/arm/armhf/g')amd64.deb
RUN wget https://github.com/badaix/snapcast/releases/download/v${SNAPCAST_VERSION}/snapserver_${SNAPCAST_VERSION}-1_$(echo $TARGETARCH | sed 's/arm/armhf/g')armhf.deb

# RUN dpkg -i snapserver_${SNAPCAST_VERSION}-1_$(echo $TARGETARCH | sed 's/arm/armhf/g')amd64.deb \
RUN dpkg -i snapserver_${SNAPCAST_VERSION}-1_$(echo $TARGETARCH | sed 's/arm/armhf/g')armhf.deb \
  ;  apt-get update \
  && apt-get -f install -y \
  && rm -rf /var/lib/apt/lists/*

RUN /usr/bin/snapserver -v

COPY snapserver.conf /tmp/snapserver_share/snapserver.conf
COPY snapserver.conf /etc/snapserver.conf
EXPOSE 1704 1705 1780 5000





######
# Shairport setup - TODO: Move to own container
######



COPY shairport-sync.sync /tmp/snapserver_share/shairport-sync.sync
COPY shairport-sync.sync /etc/shairport-sync.sync

RUN apt-get update
RUN apt-get upgrade

# Install dependencies
RUN apt-get install -y autoconf automake avahi-daemon build-essential git libasound2-dev libavahi-client-dev libconfig-dev libdaemon-dev libpopt-dev libssl-dev libtool xmltoman

# Build the bin with stdout backend
RUN git clone https://github.com/mikebrady/shairport-sync.git

# 
RUN cd shairport-sync && autoreconf -i -f
# Snapserver will start an instance instead of starting on on boot
# set backend - mdns support - <deprecated> - send metadata along
RUN cd shairport-sync && ./configure --with-stdout --with-avahi --with-ssl=openssl --with-metadata && make && make install
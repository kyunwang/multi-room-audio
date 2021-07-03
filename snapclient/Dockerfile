# FROM alpine:3.8
FROM debian:buster-slim

WORKDIR /data
ARG SNAPCAST_VERSION=0.25.0
# Set non interactive during build
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get full-upgrade

# 
RUN apt-get install -y build-essential
RUN apt-get install -y libasound2-dev libpulse-dev libvorbisidec-dev libvorbis-dev libopus-dev libflac-dev libsoxr-dev alsa-utils libavahi-client-dev avahi-daemon libexpat1-dev
RUN apt-get install -y git bash

#
RUN apt-get update \
  && apt-get install -y wget ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# Get snapclient and install
RUN wget https://github.com/badaix/snapcast/releases/download/v${SNAPCAST_VERSION}/snapclient_${SNAPCAST_VERSION}-1_$(echo $TARGETARCH | sed 's/arm/armhf/g')armhf.deb

RUN dpkg -i snapclient_${SNAPCAST_VERSION}-1_$(echo $TARGETARCH | sed 's/arm/armhf/g')armhf.deb \
  ;  apt-get update \
  && apt-get -f install -y \
  && rm -rf /var/lib/apt/lists/*

RUN /usr/bin/snapclient -v
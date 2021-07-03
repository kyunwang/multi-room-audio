#!/bin/sh

if [ ! -f "/etc/mopidy/mopidy.conf" ]
then
    cp /etc/default/mopidy.conf  /etc/mopidy/mopidy.conf
fi

# mopidy --config /etc/mopidy/mopidy.conf local scan "$@"
mopidy --config /etc/mopidy/mopidy.conf "$@"
# exec mopidy --config /etc/mopidy/mopidy.conf "$@"
# exec mopidy --config /mopidy/mopidy.conf "$@"


# sudo dpkg-reconfigure mopidy # Yes - boot at boot
# sudo service mopidy status # ip:6680 should now be up

# sudo mopidyctl config

# exec /usr/bin/mopidy --config /usr/share/mopidy/conf.d:/etc/mopidy/mopidy.conf config
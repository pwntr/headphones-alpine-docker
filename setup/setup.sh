#!/bin/sh

# update the base system
apk update && apk upgrade

# we need pyhon and git, move along
apk add python git

# add a non-root user and group called "nzbget" with no password, no home dir, no shell, and gid/uid set to 1000
addgroup -g 1000 headphones && headphones -H -D -G nzbget -s /bin/false -u 1000 nzbget

# create the dirs and volume mount points
mkdir /config && mkdir /downloads && mkdir /music

# download the latest headphones version to /headphones
git clone https://github.com/rembo10/headphones.git

# change the owner accordingly
chown -R headphones:headphones /headphones /config /downloads /music

# also, clear the apk cache:
rm -rf /var/cache/apk/*

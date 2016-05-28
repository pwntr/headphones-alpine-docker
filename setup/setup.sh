#!/bin/sh

# update the base system
apk update && apk upgrade

# we need pyhon and git, move along
apk add python git

# add a non-root user and group called "nzbget" with no password, no home dir, no shell, and gid/uid set to 1000
addgroup -g 1000 headphones && adduser -H -D headphones -G headphones -s /bin/false -u 1000

# create the dirs and volume mount points
mkdir /config /data /downloads /music

# download the latest headphones version to /headphones
git clone https://github.com/rembo10/headphones.git

# add the first and currently only entry to our config file to accept requests from all IPs
printf "[General]\nhttp_host = 0.0.0.0" > /config/headphones.ini

# change the owner accordingly
chown -R headphones:headphones /headphones /config /data /downloads /music

# also, clear the apk cache:
rm -rf /var/cache/apk/*

#!/bin/bash
set -e
source /build/buildconfig
set -x

#apt-get --purge autoremove -y squid-deb-proxy-client
echo 'Acquire::https::Proxy "http://squid.trusty.dev.docker:8000/";' >> /etc/apt/apt.conf.d/30manualproxy

## Brightbox Ruby 1.9.3 and 2.0.0
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C3173AA6
echo deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu precise main > /etc/apt/sources.list.d/brightbox.list

## Phusion Passenger
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
if [[ "$PASSENGER_ENTERPRISE" ]]; then
	echo deb https://download:$PASSENGER_ENTERPRISE_DOWNLOAD_TOKEN@www.phusionpassenger.com/enterprise_apt precise main > /etc/apt/sources.list.d/passenger.list
else
	echo deb https://oss-binaries.phusionpassenger.com/apt/passenger precise main > /etc/apt/sources.list.d/passenger.list
fi

## Chris Lea's Node.js PPA
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C7917B12
echo deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu precise main > /etc/apt/sources.list.d/nodejs.list

## Rowan's Redis PPA
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5862E31D
echo deb http://ppa.launchpad.net/rwky/redis/ubuntu precise main > /etc/apt/sources.list.d/redis.list

apt-get update

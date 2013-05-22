#!/bin/bash

# This script minimal a fresh installed Debian/Ubuntu system and update it to latest
apt-get --force-yes -y purge lynx memtester unixodbc python-* odbcinst-* tcpdump ttf-* apache2-* bind9-* xinetd samba-* nscd-* portmap sendmail-* sasl2-bin
# Then type "Yes, do as I say!" to continue
apt-get --force-yes -y autoremove && apt-get autoclean && apt-get update && apt-get --force-yes -y dist-upgrade
apt-get --force-yes -y python-apt

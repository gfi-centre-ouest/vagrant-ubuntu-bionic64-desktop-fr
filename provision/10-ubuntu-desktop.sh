#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
sudo apt-get clean
sudo apt-get update
sudo apt-get install -y ubuntu-desktop

# avahi-daemon may cause issues with .local domains
sudo apt-get purge -y avahi-daemon

# Vagrant DNS configuration works better with resolveconf package (/etc/resolvconf/resolv.conf.d/)
sudo apt-get install -y  resolvconf

# Use resolv.conf stub from systemd-resolve
sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf

# Disable systemd-resolved DNS stub listener to avoid tcp/53 binding
if grep -q "#DNSStubListener=" "/etc/systemd/resolved.conf"; then
  sudo sed -i "s|.*#DNSStubListener=.*|DNSStubListener=no|" "/etc/systemd/resolved.conf"
fi

sudo service systemd-resolved restart

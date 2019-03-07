#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive

# sudo systemctl restart systemd-resolved.service

# avahi-daemon may cause issues with .local domains
sudo systemctl disable avahi-daemon
sudo systemctl stop avahi-daemon

# purge the package to remove it's reference inside /etc/nsswitch.conf (mdns4 / mdns4_minimal)
sudo apt-get purge -fy avahi-daemon

# Use dnsmasq and resolvconf
sudo apt-get install -y dnsmasq resolvconf
sudo sh -c "echo address=/.test/127.0.0.1>/etc/dnsmasq.d/test-domain-to-localhost"

# Disable systemd-resolved by adding fallback resolv.conf file to resolvconf tail
sudo ln -fs /run/systemd/resolve/resolv.conf /etc/resolvconf/resolv.conf.d/tail
sudo resolvconf --enable-updates
sudo resolvconf -u

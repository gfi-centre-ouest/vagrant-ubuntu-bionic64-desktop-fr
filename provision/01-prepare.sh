#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive

sudo sed -i 's|http://archive.ubuntu.com|http://fr.archive.ubuntu.com|g' /etc/apt/sources.list

sudo apt-get clean
sudo apt-get update

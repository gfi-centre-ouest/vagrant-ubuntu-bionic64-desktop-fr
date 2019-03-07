#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive

sudo apt-get -y install `check-language-support -l $CONFIG_LANGUAGE`
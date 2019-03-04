# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  env = {
      CONFIG_LOCALE: 'fr_FR.UTF-8',
      CONFIG_LANGUAGE: 'fr_FR',
      CONFIG_KEYBOARD_LAYOUT: 'fr',
      CONFIG_KEYBOARD_VARIANT: 'latin9',
      CONFIG_TIMEZONE: 'Europe/Paris'
  }
  
  config.vm.provision 'locale', type: 'shell', privileged: false, path: 'provision/02-locale.sh', env: env
  config.vm.provision 'ubuntu-desktop', type: 'shell', privileged: false, path: 'provision/10-ubuntu-desktop.sh', env: env
  config.vm.provision 'language-support', type: 'shell', privileged: false, path: 'provision/20-language-support.sh', env: env
end

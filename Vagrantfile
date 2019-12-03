# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = 2

userdata = File.read('provision/userdata')

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  box = 'archlinux-2019.12.01-x86_64.box'
  config.vm.box = box
  config.vm.provider 'virtualbox' do |vb|
    vb.cpus = 2
    vb.memory = 4096
  end

  config.vm.network :private_network, type: 'dhcp', virtualbox__intnet: 'intnet'

  config.vm.provision :shell, privileged: false, inline: userdata
end

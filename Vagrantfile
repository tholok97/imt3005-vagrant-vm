# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # box this development environment is built around
  config.vm.box = "ubuntu/bionic64"
  config.vm.box_version = "20180927.0.0"

  # set name of vm
  config.vm.define "imt3005-vagrant-vm"

  # runs bootscript to install packages
  config.vm.provision "shell" do |s|
    s.binary = true
    s.path   = "bootstrap.sh"
  end

  # copy over openstack.rc
  config.vm.provision "file" do |f|
    f.source      = "openstack.rc"
    f.destination = "$HOME/openstack.rc"
  end

  # copy over .profile 
  config.vm.provision "file" do |f|
    f.source      = ".profile"
    f.destination = "$HOME/.profile"
  end

  # copy over .bash_aliases
  config.vm.provision "file" do |f|
    f.source      = ".bash_aliases"
    f.destination = "$HOME/.bash_aliases"
  end

  # copy over .vimrc
  config.vm.provision "file" do |f|
    f.source      = ".vimrc"
    f.destination = "$HOME/.vimrc"
  end

end

# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

environment = YAML.load_file(File.join(File.dirname(__FILE__), 'config/environment.yaml'))

Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|

  # box this development environment is built around
  config.vm.box = "ubuntu/xenial64"
  config.vm.box_version = "20181005.0.0"

  # set name of vm
  config.vm.define "imt3005-vagrant-vm"

  # runs bootscript to install packages
  config.vm.provision "shell" do |s|
    s.binary = true
    s.path   = "config/bootstrap.sh"
    s.args = [ environment['git']['email'], environment['git']['name']]
  end

  # copy over openstack.rc
  config.vm.provision "file" do |f|
    f.source      = "config/openstack.rc"
    f.destination = "$HOME/openstack.rc"
  end

  # copy over .profile 
  config.vm.provision "file" do |f|
    f.source      = "config/.profile"
    f.destination = "$HOME/.profile"
  end

  # copy over .bash_aliases
  config.vm.provision "file" do |f|
    f.source      = "config/.bash_aliases"
    f.destination = "$HOME/.bash_aliases"
  end

  # copy over .bashrc
  config.vm.provision "file" do |f|
    f.source      = "config/.bashrc"
    f.destination = "$HOME/.bashrc"
  end

  # copy over .bash_completion
  config.vm.provision "file" do |f|
    f.source      = "config/.bash_completion"
    f.destination = "$HOME/.bash_completion"
  end

  # copy over .vimrc
  config.vm.provision "file" do |f|
    f.source      = "config/.vimrc"
    f.destination = "$HOME/.vimrc"
  end

  # sync repo folder synced/ with VM folder ~/synced/
  config.vm.synced_folder "synced/", "/home/vagrant/synced/", create: true

end

#!/bin/bash
apt-get update

# install necessary stuff for openstack cli client to work
apt-get -y install python-dev python-pip

# Install openstack cli client
# (Taken from: https://github.com/datacentred/openstack-cli-vagrant/blob/master/scripts/install_apt.sh)
sudo pip install -U cffi
sudo pip install --upgrade 'urllib3[secure]'
sudo pip install pytz 
sudo pip install cryptography idna
sudo pip install python-{openstack,keystone,nova,glance,cinder,neutron,ceilometer,heat}client

# add puppetlabs repo
wget https://apt.puppetlabs.com/puppet5-release-xenial.deb -O /tmp/puppet5-release-xenial.deb 
sudo dpkg -i /tmp/puppet5-release-xenial.deb
apt-get update

# install puppet-agent
apt-get -y install puppet-agent

# install pdk
apt-get -y install pdk

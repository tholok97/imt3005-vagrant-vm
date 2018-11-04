#!/bin/bash

# Arguments:
# $1 - git user email
# $2 - git user name

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
curl -o /tmp/puppet5-release-xenial.deb https://apt.puppetlabs.com/puppet5-release-xenial.deb
sudo dpkg -i /tmp/puppet5-release-xenial.deb
apt-get update

# install puppet-agent
apt-get -y install puppet-agent

# install pdk
apt-get -y install pdk

# install puppet-lint
apt-get -y install puppet-lint

# setup git user. 
cat <<EOF > /home/vagrant/.gitconfig
[user]
  email = $1
  name = $2
EOF

# install vagrant
curl -o /tmp/vagrant_2.2.0_x86_64.deb https://releases.hashicorp.com/vagrant/2.2.0/vagrant_2.2.0_x86_64.deb
dpkg -i /tmp/vagrant_2.2.0_x86_64.deb

# install openstack plugin
# (has to be installed by user vagrant)
runuser -l vagrant -c 'vagrant plugin install vagrant-openstack-provider'

# install latex with dependancy required for "minted" latex package to work
apt-get -y install texlive-latex-extra python-pygments

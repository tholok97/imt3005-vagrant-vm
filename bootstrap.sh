#!/bin/bash
apt-get update
apt-get -y install python-dev python-pip
sudo pip install -U cffi
sudo pip install --upgrade 'urllib3[secure]'
sudo pip install pytz 
sudo pip install cryptography idna
sudo pip install python-{openstack,keystone,nova,glance,cinder,neutron,ceilometer,heat}client

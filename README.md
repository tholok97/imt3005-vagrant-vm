# Vagrant-defined VM for working with IMT3005 - Infrastructure as Code

## Description

This repo defines the virtual machine I use for working with OpenStack and Puppet in the course IMT3005 - Infrastructure as Code using Vagrant. The machine is based on Ubuntu 16.04, and comes with the OpenStack CLI tools, pdk, and puppet-agent installed. Configuration is done through the Vagrantfile, so that the environment is disposable and reproducable.

## Setup

1. Set up Vagrant and VirtualBox if you haven't already.
1. Clone this repo.
1. Download (or write) a `openstack.rc` file. Should be using version 3. Place it in the cloned repo.
1. Run `vagrant up` from within the cloned repo. Vagrant will create and provision the VM.
1. Run `vagrant ssh` to connect to the VM. You'll be prompted for your password.
1. Try and run `openstack image list`. If this command succeeds without error (i.e. you are shown a table of VM images) everything should be set up correctly.

**If you don't want to have to put in your password every time you login**, you can edit the `openstack.rc` file to include your password. Change this:

```
echo "Please enter your OpenStack Password for project $OS_PROJECT_NAME as user $OS_USERNAME: "
read -sr OS_PASSWORD_INPUT
export OS_PASSWORD=$OS_PASSWORD_INPUT
```

To this:

```
export OS_PASSWORD=<your-password-here>
```

Beware that your password is now stored in plaintext in `openstack.rc`.

## Configuration files

Change these to alter the VM.

* **`bootstrap.sh`**: Installs OpenStack CLI tools, puppet, pdk. Anything you want configured during provisioning should be put here.
* **`openstack.rc`**: Provides environment variables for the OpenStack CLI tools. You have to provide this yourself. See "setup".
* **`.profile`**: This file is sourced upon login. Used to source `openstack.rc`.
* **`.bash_aliases`**: Contains handy bash aliases.
* **`.vimrc`**: Contains vim configuration for environment.

## TODO

- [x] Basic concept working!
- [ ] Implement more seamless way to authenticate. API token?
- [ ] Organize repo in folders.
- [ ] Explore provisioning through Puppet.
- [ ] Explore synced folders.
- [ ] Make sure provisioning is idempotent.

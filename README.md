# Vagrant-defined VM for working with IMT3005 - Infrastructure as Code

## Description

This repo defines the virtual machine I use for working with OpenStack and Puppet in the course IMT3005 - Infrastructure as Code using Vagrant. The machine is based on Ubuntu 16.04, and comes with the OpenStack CLI tools, pdk, and puppet-agent installed. Configuration is done through a Vagrantfile, so that the environment is disposable and reproducable.

## Structure

* **config/**: Contains config files used during provisioning.
* **synced/**: Is synced to `~/synced/` in the VM, and contents are ignored by git. Use it to store things that should persist between `vagrant destroy`'s.
* **.gitignore**: Gitignore for repo.
* **README.md**: This readme.
* **Vagrantfile**: Tells Vagrant how to provision the VM.

## Setup

1. Set up Vagrant and VirtualBox if you haven't already.
1. Clone this repo.
1. Download (or write) a `openstack.rc` file. Should be using version 3. Place it in the `config/` folder.
1. Create a `config/environment.yaml` file. An example of what this file should look like is found in `config/environment_example.yaml`, so you can run `cp config/environment_example.yaml config/environment.yaml` to create it.
1. Edit the `config/environment.yaml` with your own settings.
1. If you don't want to type your password on every login, see below before continuing.
1. Run `vagrant up` from within the cloned repo. Vagrant will create and provision the VM.
1. Run `vagrant ssh` to connect to the VM. You'll be prompted for your password if you did not hardcode it in `openstack.rc`.
1. Try and run `openstack image list`. If this command succeeds without error (i.e. you are shown a table of VM images) everything should be set up correctly.

**If you don't want to type your password on every login**, you can edit the `openstack.rc` file to include your password. Change this:

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

## Usage

*TBA*

## Configure

Change these files to alter the VM. Remember that you need to re-provision the VM for the changes to take effect. (e.g. `vagrant reload --provision`).

* **`config/bootstrap.sh`**: Installs OpenStack CLI tools, puppet, pdk. Anything you want configured during provisioning should be put here.
* **`config/openstack.rc`**: Provides environment variables for the OpenStack CLI tools. You have to provide this yourself. See "setup".
* **`config/.profile`**: This file is sourced upon login. Used to source `openstack.rc`.
* **`config/.bash_aliases`**: Contains handy bash aliases.
* **`config/.bash_aliases`**: Contains output of `openstack complete`. Used to provide autocompletion in OpenStack CLI.
* **`config/environment.yaml`**: Environment-specific settings. You have to provide this youself. See "setup".
* **`config/environment_example.yaml`**: Example of what the above file should look like.
* **`config/.vimrc`**: Contains vim configuration for environment.

## TODO

- [x] Basic concept working!
- [x] Autocompletion for OpenStack CLI tool
- [ ] Generate autocompletion file based on installed OpenStack CLI tool? The way it's set up right now a version bump to the tool without updating the completion file might cause trouble..
- [ ] Implement more seamless way to authenticate. API token?
- [x] Organize repo in folders.
- [ ] Explore provisioning through Puppet.
- [ ] Explore synced folders.
- [ ] Make sure provisioning is idempotent.
- [ ] Include git user configuration as part of provisioning process
- [ ] Figure out smoother way to bring in ssh keys. Currently they have to be manually copied in for every new machine, as placing them in the synced folder will store them as 777, which gives "unprotected private key file" errors from ssh.

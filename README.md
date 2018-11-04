# Vagrant-defined VM for working with IMT3005 - Infrastructure as Code

## Introduction

This repo defines a Vagrant environment for working with the course IMT3005 - Infrastructure as Code. As Virtual Machines created using this method are disposable, you can experiment to your heart's content without messing anything up.

## Included tools

* OpenStack CLI
* pdk
* puppet-agent
* puppet-lint
* Vagrant
* LaTeX

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
1. Consider editing the `config/bootstrap.sh` script to remove LaTeX, as installing it takes a long time. In the future I'll make this configurable through the `config/environment.yaml` file.
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

Place anything you want to persist beyond the life of the machine in the `synced` folder. Use the environment in such a way that destroying it and creating it from scratch does not affect your work.

**Exception**: Windows will force everything inside the synced folder to have 777 permissions, which means storing private keys there will make ssh unhappy. I usually have a copy in the synced folder, and then manually copy it outside the folder to correctly be able to set permissions. This is a manual task that needs to be done every time the machine is created from scratch, and I am looking into how the situation can be improved.

## Configure

Change these files to alter the VM. Remember that you need to re-provision the VM for the changes to take effect. (e.g. `vagrant reload --provision`).

* **`config/bootstrap.sh`**: Installs tools needed for course. Anything you want configured during provisioning should be added there.
* **`config/openstack.rc`**: Provides environment variables for the OpenStack CLI tools. You have to provide this yourself. See "setup".
* **`config/.profile`**: This file is sourced upon login. Used to source `openstack.rc`.
* **`config/.bash_aliases`**: Contains handy bash aliases.
* **`config/.bash_aliases`**: Contains output of `openstack complete`. Used to provide autocompletion in OpenStack CLI.
* **`config/environment.yaml`**: Environment-specific settings. You have to provide this yourself. See "setup".
* **`config/environment_example.yaml`**: Example of what the above file should look like.
* **`config/.vimrc`**: Contains vim configuration for environment.

## TODO

- [x] Basic concept working!
- [x] Autocompletion for OpenStack CLI tool
- [ ] Generate autocompletion file based on installed OpenStack CLI tool? The way it's set up right now a version bump to the tool without updating the completion file might cause trouble..
- [ ] Implement more seamless way to authenticate. API token?
- [x] Organize repo in folders.
- [ ] Explore provisioning through Puppet.
- [x] Explore synced folders.
- [ ] Make sure provisioning is idempotent.
- [x] Include git user configuration as part of provisioning process
- [ ] Figure out smoother way to bring in ssh keys. Currently they have to be manually copied in for every new machine, as placing them in the synced folder will store them as 777, which gives "unprotected private key file" errors from ssh.
- [ ] Explore using OpenStack as provider.
- [x] Add Vagrant to bootscript.
- [x] Include Vagrant and LaTeX.
- [ ] Implement toggles in yaml configuration file to turn off installation of selected packages (LaTeX).

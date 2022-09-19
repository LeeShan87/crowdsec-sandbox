# CrowdSec sandbox 

This repo helps you to try out CrowdSec in a sandbox environment.

# Requirements

- [https://www.virtualbox.org/](VirtualBox)
- [https://www.vagrantup.com/](Vagrant)

# Setup

git clone this repo

copy config.yaml.example as config.yaml and add your preferences.

In the configuration file, you can add:

- You can choose your provisioner. Eg: SaltStack (default), Ansible, or Chef
- Your default box to use. If not set, CentOS 7 will be used.

vagrant up

# Available hosts:

Detailed information and limitations about available hosts, should be listed in the provisioner's Readme.md-s

- kali
- default(CentOS 7, or your config setting)
- centos6
- centos7
- centos8
- cloudlinux6, a license should be added to use it properly
- cloudlinux7, a license should be added to use it properly
- cloudpanel6, CloudLinux 6 with Cpanel. A license should be added to use it properly
- debian8
- debian9
- debian10
- ubuntu16
- ubuntu18
- ubuntu20
- rhel6, a license should be added to use it properly
- rhel7, a license should be added to use it properly
- rhel8, a license should be added to use it properly
- opensuse423

# Provisioner

- [SaltStack](./provision/salt/Readme.md), default
- [Ansible](./provision/ansible/Readme.md), not complete yet.
- [Chef](./provision/chef/Readme.md), not complete yet.

# Generating SSH keypair

- [Linux](https://www.ssh.com/ssh/keygen/)
- [Windows](https://ubuntu.com/tutorials/ssh-keygen-on-windows)

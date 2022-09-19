# CrowdSec sandbox environment with SaltStack

This repo helps you to try out CrowdSec in a sandbox environment, provision with [SaltStack](https://www.saltstack.com/)

## setup

vagrant up

## Available hosts:

- attacker(Debian 8)
- kali
- default(CentOS 7, or your config setting)
- centos6
- centos7
- centos8
- cloudlinux6, a license should be added to use it properly
- cloudlinux7, a license should be added to use it properly
- cloudpanel6, CloudLinux 6 with Cpanel, a license should be added to use it properly
- debian7
- debian8
- debian9
- debian10
- ubuntu14
- ubuntu16
- ubuntu18
- rhel6, a license should be added to use it properly
- rhel7, a license should be added to use it properly
- rhel8, a license should be added to use it properly
- opensuse423, experimental


## Adding new host to the available list

- Check if the new OS is supported by SaltStack on: https://docs.saltstack.com/en/latest/topics/installation/#platform-specific-installation-instructions
- Search for vagrant box for the given OS at: https://app.vagrantup.com/boxes/search
- Create a minion config for the new host at: saltstack/etc/<configname>. Containing the hostname of the new host like: 'id: victim-opensuse42.3'
- Update README.md with the new host


## Calling salt commands on minion

Almost every salt command can be called on the minion with:

```
salt-call --local <salt command>
```

Eg:

```
salt-call --local test.ping
salt-call --local cmd.run uptime
```

## Useful salt command:

- salt '\*' test.ping , Checks available minions.
- salt 'victim-\*' , Checks available victim minions.
- salt 'victim-dabian8' , Checks if victim-debian8 (the default vm) is available.
- salt '\*' cmd.run 'echo "hello"' , Runs echo "hello" on every available minion, and returns thier out put.
- salt 'victim-debian8' state.apply docker test=True , Checks what would change, if docker state would appllied to victim-dabian8 minion.
- salt 'victim-debian8' state.apply docker , applying docker state on victim-dabian8 minion.


## More about salt

- Docs : [docs.saltstack.com](https://docs.saltstack.com/en/latest/)
- Formulas docs: [https://docs.saltstack.com/en/master/topics/development/conventions/formulas.html](https://docs.saltstack.com/en/master/topics/development/conventions/formulas.html)
- Formulas GitHub: [https://github.com/saltstack-formulas](https://github.com/saltstack-formulas)

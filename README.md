ossl-ansible-vagrantbox-init
============================

Ansible playbook for creating inital vagrant box.

- These playbooks require Ansible 1.2.
- Expects CentOS/RHEL 6 hosts


This ansible playbook should help quicker setup for initial vagrant box.
Steps are based on: http://docs-v1.vagrantup.com/v1/docs/base_boxes.html.

This playbook includes tasks:
- Disable SELinux.
- Create 'admin' group.
- Create 'vagrant' account with 'vagrant' password and ssh key-based
authentication with key from vagrant github repo.
- Configure sudo to allow run commands without password to 'admin' group.


So far this playbook not installing VirtualBox Guest Additions.


Runing the playbook:

       ansible-play -i hosts_vagrant-init site-vagrant-init.yml

Or in quicker way (make must be installed)

       make deploy-vagrantinit

To see all available make options, run:

       make


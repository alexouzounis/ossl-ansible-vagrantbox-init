ossl-ansible-vagrantbox-init
============================

Ansible playbook for creating inital vagrant box.

- These playbooks require Ansible 1.2.
- Expects CentOS/RHEL 6 hosts


This ansible playbook should help quicker setup for initial vagrant box.

- Configuration is based on: http://docs-v1.vagrantup.com/v1/docs/base_boxes.html.

This playbook includes tasks:
- Disable SELinux (option to choose whether disable or not / default: no)
- Create 'admin' group.
- Create 'vagrant' account with 'vagrant' password and ssh key-based
authentication with key from vagrant github repo.
- Configure sudo to allow run commands without password to 'admin' group.
- Install required packages for builds VirtualBox Guest Addons
- Download VirtualBox Guest Addons ISO (Version can be provided)
- Build VirtualBox Guest Addons kernel modules
- Tidy up VM after installation (Remove temporay files)
- Remove packages for saving space: kernel-devel, kernel-source
- Remove udev/70-persistent-net.rules - will be created during boot VM.


Steps to build initial vagrant VM (Based on CentOS).

- Create VirtualBox basic VM (root password: vagrant)
- Login to VM via console and run command

  yum -y install kernel kernel-devel kernel-headers

- Reboot VM

After reboot run the playbook:

  ansible-play -i hosts_vagrant-init site-vagrant-init.yml

Or in quicker way (make must be installed)

  make deploy-vagrantinit

To see all available make options, run:

  make

When ansible finished, shutdown VM

  sync
  shutdown -h now

Follow instructions from vagrant websites how to build vagrant box.

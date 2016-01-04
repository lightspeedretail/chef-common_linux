# common_linux cookbook

This cookbook provides basic low level configuration for Linux systems, for instance configuring hostnames, ntp, syslog and chef-client. For those most part, functionality will be added here by including third party cookbooks.

# Requirements

This cookbook requires *Chef 12.5.0* or later.

# Platform

Ubuntu / AWS

# Included cookbooks

- chef-client
- apt
- ubuntu
- build-essentials
- ntp
- ulimit
- sysctl
- rsyslog_ng

# Attributes

##### common.repositories

Hash of repositories used to create `apt_repository` resources. This could always be extended to support `yum_repository` resources at a alter time as well.

##### common.packages | common.gems | common.chef_gems

Hashes enabling you to define `package`, `gem` and `chef_gem` packages that should be installed during the chef run. 

##### common.iptables

Hashes enabling you to define `iptables` lwrp definitions.

# LWRP

## hostname

Simple resource designed to set the hostname on Ubuntu machines.

## timezone

Simple resource designed to set the timezone on Ubuntu machines.


#
# Cookbook Name:: chef_common_linux
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

timezone node[:common_linux][:timezone]
hostname node[:common_linux][:hostname]

include_recipe "#{cookbook_name}::chef_client"
include_recipe "#{cookbook_name}::ubuntu"
include_recipe "#{cookbook_name}::packages"
include_recipe "#{cookbook_name}::linux"
include_recipe "#{cookbook_name}::iptables"
include_recipe "#{cookbook_name}::syslog"


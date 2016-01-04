
timezone node[:common][:linux][:timezone]
hostname node[:common][:linux][:hostname]

include_recipe "ntp::default"
include_recipe "ulimit::default"
include_recipe "sysctl::apply"


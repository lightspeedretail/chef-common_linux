name "chef_common_linux"

default_source :supermarket
#default_source :chef_server

run_list(
  "chef_common_linux::default"
)

# Attributes
#
default[:authorization][:sudo][:groups] = %w(devops)
default[:openssh][:server][:allow_groups] = %w(devops deploy)

default[:ntp][:servers] = %w(
  0.amazon.pool.ntp.org
  1.amazon.pool.ntp.org
  2.amazon.pool.ntp.org
  3.amazon.pool.ntp.org
)

default[:common][:packages].tap do |config|
  config["awscli"] = true
  config["ec2-api-tools"] = true
  config["git-core"] = true
  config["python-setuptools"] = true
  config["python-virtualenv"] = true
  config["python-pip"]        = true
  config["python-docutils"]   = true
  config["ruby"] = true
  config["ruby1.9.1-dev"] = true
end

default[:common][:linux].tap do |config|
  config[:sudoers][:ubuntu].tap do |sudoer|
    sudoer[:user] = "ubuntu"
    sudoer[:runas] = "root"
    sudoer[:nopasswd] = true
  end

  config[:sudoers][:deploy].tap do |sudoer|
    sudoer[:group] = "deploy"
    sudoer[:runas] = "root"
    sudoer[:nopasswd] = true
    sudoer[:commands] = ["/usr/bin/chef-client"]
  end

  config[:sudoers]["90-cloud-init-users"].tao do |sudoer|
    sudoer[:action] = :remove
  end
end

# Cookbooks
#
cookbook "chef_common_linux", path: "."
cookbook "rsyslog_ng", path: "../rsyslog_ng"

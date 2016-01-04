name "common_linux"

default_source :supermarket
#default_source :chef_server

run_list(
  "common_linux::default"
)

# Attributes
#
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

# Cookbooks
#
cookbook "common_linux", path: "."
cookbook "rsyslog_ng", path: "../rsyslog_ng"

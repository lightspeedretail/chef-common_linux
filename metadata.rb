name 'common_linux'
maintainer 'Jonathan Serafini'
maintainer_email 'jonathan@serafini.ca'
issues_url 'https://github.com/JonathanSerafini/chef-common_linux/issues'
source_url 'https://github.com/JonathanSerafini/chef-common_linux'
license 'apachev2'
description 'Installs/Configures chef_common_linux'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
chef_version '>= 12.7'
version '0.6.0'

depends 'apt'
depends 'build-essential'
depends 'chef-client'
depends 'cron'
depends 'git',      '= 9.0.1'
depends 'hostsfile'
depends 'iptables'
depends 'logrotate'
depends 'ntp'
depends 'ohai',     '< 5.3.0'
depends 'rsyslog_ng'
depends 'sysctl'
depends 'ubuntu',   '= 2.0.1'
depends 'ulimit'

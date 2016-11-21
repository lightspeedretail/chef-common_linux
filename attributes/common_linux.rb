
default[:common_linux].tap do |config|
  config[:timezone]   = 'Etc/UTC'
  config[:hostname]   = node.name
  config[:domainname] = 'localdomain'

  # Ubuntu PPAs / Yum repositories
  #
  config[:repositories] ||= {}

  # Iptables configuration
  #
  config[:iptables] ||= {}

  # Packages to install
  # 
  # This attribute supports a hash of package names with values of either 
  # true, false or a hash. When the value is a boolean, the it will be
  # automatically replaced by a hash setting the desired action of install or
  # remove. Otherwise, the hash is used to create resoure properties.
  #
  # In addition, the hash may contain the special key of `compile_time` which
  # will indicate that the package should be installed immediately.
  #
  config[:packages] ||= {}

  # Gems to install
  #
  # This attribute supports a hash of gem names with values of either true,
  # false or a hash. When the value is a boolean, the it will be automatically
  # replaced by a hash setting the desired action of install or remove.
  # Otherwise, the hash is used to create resoure properties.
  #
  # In addition, the hash may contain the special key of `compile_time` which
  # will indicate that the package should be installed immediately.
  #
  config[:gems]     ||= {}
  
  # Chef Gems to install
  #
  # This attribute supports a hash of gem names with values of either true,
  # false or a hash. When the value is a boolean, the it will be automatically
  # replaced by a hash setting the desired action of install or remove.
  # Otherwise, the hash is used to create resoure properties.
  #
  config[:chef_gems]     ||= {}
end


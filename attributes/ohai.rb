
default[:chef_client][:ohai].tap do |config|
  config[:disabled_plugins] = %w(
    aix azure darwin digital_ocean eucalyptus freebsd joyent linode 
    netbsd openbsd openstack powershell rackspace solaris2 windows
  )
end


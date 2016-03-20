
resource_name :common_hostname

property :host_name,
  kind_of: String,
  identity: true,
  default: lazy { |r| node[:common_linux][:hostname] }

property :domain_name,
  kind_of: String,
  identity: true,
  default: lazy { |r| node[:common_linux][:domainname] }

# Ensure that the resource is applied regardless of whether we are in why_run
# or standard mode.
#
# Refer to chef/chef#4537 for this uncommon syntax
action_class do
  def whyrun_supported?
    true
  end
end

action :set do
  hostsfile_entry node[:ipaddress] do
    hostname  "#{host_name}.#{domain_name}".downcase
    aliases   [host_name.downcase]
    unique    true
  end

  file "/etc/hostname" do
    content "#{host_name}.#{domain_name}".downcase
    notifies :restart,  "service[hostname]", :immediately
  end

  ohai "reload-hostname" do
    plugin "hostname"
    action :nothing
  end

  service "hostname" do
    action :nothing
    notifies :reload,   "ohai[reload-hostname]", :immediately
  end
end


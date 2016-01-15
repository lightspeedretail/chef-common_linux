
resource_name :hostname

property :host_name,
  kind_of: String,
  identity: true,
  default: lazy { |r| node[:common][:linux][:hostname] }

property :domain_name,
  kind_of: String,
  identity: true,
  default: lazy { |r| node[:common][:linux][:domainname] }

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


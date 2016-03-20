
resource_name :common_timezone

property :timezone,
  kind_of: String,
  default: lazy { |r| r.node[:common_linux][:timezone] || "Etc/UTC" },
  required: true

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
  template "/etc/timezone" do
    variables timezone: timezone
    notifies :run, "execute[reload timezone]"
    notifies :restart, "service[cron]"
  end

  execute "reload timezone" do
    command "/usr/sbin/dpkg-reconfigure -f noninteractive tzdata"
    action :nothing
  end

  service "cron" do
    action :nothing
  end
end


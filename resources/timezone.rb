
resource_name :timezone

property :timezone,
  kind_of: String,
  default: lazy { |r| r.node[:common_linux][:timezone] || "Etc/UTC" },
  required: true

action :set do
  template "/etc/timezone" do
    variables timezone: timezone
    notifies :run, "bash[reload timezone]"
    notifies :restart, "service[cron]"
  end

  bash "reload timezone" do
    code "/usr/sbin/dpkg-reconfigure -f noninteractive tzdata"
    action :nothing
  end

  service "cron" do
    action :nothing
  end
end


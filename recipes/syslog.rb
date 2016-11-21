
include_recipe 'rsyslog_ng::default'

cookbook_file '/etc/logrotate.d/rsyslog' do
  source 'rsyslog'
  mode '644'
  action :create
  notifies :reload, 'service[rsyslog]'
end

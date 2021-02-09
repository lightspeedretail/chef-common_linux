cookbook_file '/tmp/get-pip.py' do
  source  'get-pip.py'
  owner   'root'
  group   'root'
  mode    '0444'
  action  :create
end

execute 'get_pip' do
  command '/usr/bin/python /tmp/get-pip.py'
  user 'root'
end


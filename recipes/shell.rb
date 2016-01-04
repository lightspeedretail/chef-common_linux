cookbook_file "/etc/inputrc" do
  source  "bash/inputrc"
  owner   "root"
  group   "root"
  mode    "0644"
  action  :create
end

cookbook_file "/etc/vimrc" do
  source  "bash/vimrc"
  owner   "root"
  group   "root"
  mode    "0644"
  action  :create
end

cookbook_file "/etc/profile.d/prompt.sh" do
  source  "bash/prompt.sh"
  owner   "root"
  group   "root"
  mode    "0644"
  action  :create
end

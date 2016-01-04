
include_recipe "iptables::default"

node[:common][:iptables].each do |name, hash|
  iptables_rule name do
    variables hash
  end
end


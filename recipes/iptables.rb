
include_recipe "iptables::default"

node[:common][:iptables].each do |name, hash|
  iptables name do
    variables hash
  end
end



default[:chef_client].tap do |config|
  config[:config][:encrypted_data_bag_secret] = "/etc/chef/encrypted_data_bag_secret"
  config[:config][:use_policyfile] = true if node.policy_name
  config[:config][:policy_group] = node.policy_group if node.policy_group
  config[:config][:policy_name] = node.policy_name if node.policy_name

  config[:config][:ssl_verify_mode] = "verify_peer"
  config[:logrotate][:frequency] = "daily"
  config[:logrotate][:rotate] = 1
end


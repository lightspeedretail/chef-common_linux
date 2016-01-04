
default[:chef_client].tap do |config|
  config[:config][:ssl_verify_mode] = "verify_peer"
  config[:config][:encrypted_data_bag_secret] = 
    "/etc/chef/encrypted_data_bag_secret"
  config[:logrotate][:frequency] = "daily"
  config[:logrotate][:rotate] = 1
end


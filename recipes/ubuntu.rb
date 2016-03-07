
# Load APT and Ubuntu recipes
#
include_recipe "apt::default"
include_recipe "ubuntu::default"

# Load PPAs from attributes
#
node[:common_linux][:repositories].each do |name, hash|
	apt_repository name do
    common_properties hash
  end
end


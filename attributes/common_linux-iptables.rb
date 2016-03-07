
# Configure SSH firewall rules to prevent brute force attempts
# - window:   amount of time during which we count a request
# - maximum:  amount of requests before we blacklist an ip
default[:common_linux][:iptables][:iptables_protect_ssh].tap do |config|
  config[:interface] = "eth0"
  config[:port] = 22
  config[:window] = 30
  config[:maximum] = 10
end


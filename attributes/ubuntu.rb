
default[:apt][:compile_time_update] = true

default[:ubuntu].tap do |config|
  config[:archive_url] = "http://archive.ubuntu.com/ubuntu"
  config[:security_url] = "http://security.ubuntu.com/ubuntu"
  config[:components] = "main restricted universe multiverse"
end


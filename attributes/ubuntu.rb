
default[:apt][:compile_time_update] = true

default[:ubuntu].tap do |config|
  config[:archive_url] = "http://us-east-1.ec2.archive.ubuntu.com.s3.amazonaws.com"
  config[:security_url] = "http://security.ubuntu.com/ubuntu"
  config[:components] = "main restricted universe multiverse"
end


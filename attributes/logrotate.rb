
default[:logrotate][:global].tap do |config|
  config[:create]         = "0640 root adm"
  config[:dateformat]     = ".%Y-%m-%d"
  config[:delaycompress]  = false
  config[:maxage]   = 2
  config[:compress] = true
  config[:dateext]  = true
  config[:daily]    = true
  config[:weekly]   = false
  config[:yearly]   = false
end


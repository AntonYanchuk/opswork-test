file = File.open("/etc/motd.opsworks-static")



default['custom_variables'] = file.read
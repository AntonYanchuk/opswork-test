file = File.open("/etc/motd.opsworks-static")


if File.readlines("/etc/motd.opsworks-static").grep(/stack1/).size > 0
    stack_name = 'stack1'
elsif File.readlines("/etc/motd.opsworks-static").grep(/horizon-lab3b/).size > 0
    stack_name = 'horizon-lab3b'
end



default['custom_variables'] = file.read
default['stack_variable'] = stack_name
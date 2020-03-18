file = File.open("/etc/motd.opsworks-static")


if File.readlines("/etc/motd.opsworks-static").grep(/stack1/).size > 0
    stack_name = 'stack1'
    puts stack_name
elsif File.readlines("/etc/motd.opsworks-static").grep(/horizon-lab3b/).size > 0
    stack_name = 'horizon-lab3b'
    puts stack_name
end



default['custom_variables'] = file.read
default['stack_variable'] = stack_name
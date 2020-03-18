file = File.open("/etc/motd.opsworks-static")

stack_name = ""

stack_list = ['stack1', 'horizon-lab3b']
stack_list.each do |stack| 
    puts "Current stack: #{stack}" 
    if File.readlines("/etc/motd.opsworks-static").grep(/#{stack}/).size > 0
        stack_name = stack
#        puts stack_name
#        puts $(File.read("motd.opsworks-static"))
#    elsif File.readlines("motd.opsworks-static").grep(/#{stack}/).size > 0
#        stack_name = stack
    end
end

default['custom_variables'] = file.read
default['stack_variable'] = stack_name
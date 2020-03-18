file = File.open("/etc/motd.opsworks-static")

stack_name = ""

#stack_list = ['stack1', 'horizon-lab3b']

stack_list = { 
    "stack1" => 'password',
    'horizon-lab3b' => 'new-password'
    }

#

stack_list.each do |stack, pass| 
    puts "Current stack: #{stack}" 
    puts "Current password: #{pass}"
    if File.readlines("motd.opsworks-static").grep(/#{stack}/).size > 0
        stack_name = stack
        password = pass

#        puts stack_name
#        puts $(File.read("motd.opsworks-static"))
#    elsif File.readlines("motd.opsworks-static").grep(/#{stack}/).size > 0
#        stack_name = stack

    end
end

default['custom_variables'] = file.read
default['stack_variable'] = stack_name
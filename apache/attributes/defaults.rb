file = File.open("/etc/motd.opsworks-static")

stack_name = ""
password = ""

#stack_list = ['stack1', 'horizon-lab3b']

#stack_list = { 
#    "stack1" => 'password',
#    'horizon-lab3b' => 'new-password'
#    }
default['stack_list'] = { 
    "stack1": 'password',
    'horizon-lab3b': 'new-password'
}
#

node['stack_list'].each do |stack, pass| 
    puts "Current stack: #{stack}" 
    puts "Current password: #{pass}"
    if File.readlines("/etc/motd.opsworks-static").grep(/#{stack}/).size > 0
        stack_name = stack
        password = pass

#        puts stack_name
#        puts $(File.read("motd.opsworks-static"))
#    elsif File.readlines("motd.opsworks-static").grep(/#{stack}/).size > 0
#        stack_name = stack

    end
    else
        password = 'admin'
end

puts "result: #{stack_name}"
puts "result: #{password}"

default['custom_variables'] = file.read
default['stack_variable'] = stack_name
default['password'] = password
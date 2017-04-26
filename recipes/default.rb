#
# Cookbook:: lcd_web
# Recipe:: default
#
# Copyright:: 2017, Kaab Nedaria, All Rights Reserved.
#

include_recipe 'lcd_web::users'

node.default['app']['language'] = 'ruby'

hello_httpd 'greet world' do
  greeting "hello"
  action :create
end

execute 'systemctl restart httpd' do
  only_if { index_exists? }
end


# user "webadmin" do
#  comment "web admin"
#  uid 1234
#  gid "developers"
#  home "/home/webadmin"
#  shell "/bin/bash"
#end

#group 'developers' do
#  members 'webadmin'
# end

lazy_message = 'Hello World'

package node['app']['language'] do
  action :install
end

file 'lazy_message' do
  path '/tmp/lazy.txt'
  content "#{lazy_message}"
end

execute 'yum-makecache' do
  command 'yum makecache'
  notifies :create, 'file[message]', :immediately
  action :nothing
end

package 'bind-utils' do
  action :install
  notifies :run, 'execute[yum-makecache]', :before
end

file 'message' do
  path '/tmp/message.txt'
  content lazy { "#{lazy_message}" }
end

lazy_message = 'Goodbye worldd'

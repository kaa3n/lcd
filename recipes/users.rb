#
# Cookbook:: lcd_web
# Recipe:: users
#
# Copyright:: 2017, Kaab Nedaria, All Rights Reserved.
#
# group 'developers'

#admins = data_bag('admins')

#admins.each do |login|
#  admin = data_bag_item('admins', login)
#  group admin['gid']
#end

admins = []

search(:admins, "gid:admins").each do |admin|
  
  group admin['gid']
  login = admin["id"]
  admins << login
  home = "/home/#{login}"
  
  user(login) do
    uid admin['uid']
    gid admin ['gid']
    shell admin['shell']
    comment admin['comment']
    home home
    manage_home true
  end
end



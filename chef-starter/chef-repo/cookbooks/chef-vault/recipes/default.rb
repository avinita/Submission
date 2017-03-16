#
# Cookbook Name:: chef-vault
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
# #
# user 'chef-vault-test' do
#   #action :create
#   comment 'chef-vault User'
#   uid 2005
#   gid 'users'
#   home '/home/chef-vault'
#   shell '/bin/bash'
#   password 'india'
#   #supports :manage_home => true
#end
# avi_password = data_bag_item('user_password','avi')

chef_gem 'chef-vault' do
	compile_time true if respond_to?(:compile_time)
end


require 'chef-vault'

avi_password = ChefVault :: Item.load('user_password','avi')

user 'avi' do
  # manage_home true
  uid 4000
  shell '/bin/bash'
  password avi_password['password']#'india'
  home '/opt/avi'
end
#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
# sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
# sudo apt-get update
# sudo apt-get install jenkins

remote_file '/opt/jenkins-ci.org.key' do
  # owner 'root'
  # group 'root'
  # mode '0644'
  source 'https://pkg.jenkins.io/debian/jenkins-ci.org.key'
  notifies :run, 'execute[apt-key]', :immediately
  # checksum 'sha256checksum'
end

execute 'apt-key' do
  command 'apt-key add /opt/jenkins-ci.org.key'
  # creates '/tmp/something'
  action :nothing
end

file '/etc/apt/sources.list.d/jenkins.list' do
  action :create
  # owner 'root'
  # group 'root'
  # mode '0644'
  content 'deb http://pkg.jenkins.io/debian-stable binary/'
  notifies :run, 'execute[apt-get]', :immediately
end

execute 'apt-get' do
  command 'apt-get update'
  # creates '/tmp/something'
  action :nothing
end

package 'openjdk-7-jre-headless' do
  action :install
end

package 'jenkins' do
  action :install
end





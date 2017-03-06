#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

execute "apt-get update" do
  command "apt-get update"
end

group 'tomcat'

user node["username"] do
  manage_home false
  shell '/bin/nologin'
  group 'tomcat'
  home '/opt/tomcat'
end

directory node["directory_name"] do
   user 'tomcat'
   group 'tomcat'
   action :create
end

execute 'jdk_fetch' do
  command 'wget -O /opt/jdk-8u121-linux-x64.tar.gz --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gz"'
  # creates '/tmp/something'
  action :run
end

execute 'jre_fetch' do
  command 'wget -O /opt/jre-8u121-linux-x64.tar.gz --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jre-8u121-linux-x64.tar.gz"'
  action :run
end


execute 'jdk_extract' do
  command 'tar -xvf /opt/jdk-8u121-linux-x64.tar.gz -C /opt'
  #creates '/tmp/something'
  action :run
end

execute 'jre_extract' do
  command 'tar -xvf /opt/jre-8u121-linux-x64.tar.gz -C /opt'
  #creates '/tmp/something'
  action :run
end


execute 'java_install' do
  command 'update-alternatives --install /usr/bin/java java /opt/jdk1.8.0_121/bin/java 100'
  #creates '/tmp/something'
  action :run
end

execute 'javac_install' do
  command 'update-alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_121/bin/javac 100'
  #creates '/tmp/something'
  action :run
end

execute 'env_path_java' do
  command 'echo export JAVA_HOME=/opt/jdk1.8.0_121/jre >> /etc/environment'
  #creates '/tmp/something'
  action :run
end

remote_file node["directory_tomcat"] do
  user 'tomcat'
  group 'tomcat'
  mode '0775'
  source 'http://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.11/bin/apache-tomcat-8.5.11.tar.gz'
  #checksum 'sha256checksum'
end

execute 'tomcat_extract' do
  command 'tar -xvf /opt/apache-tomcat-8.5.11.tar.gz -C /opt/tomcat --strip-components=1'
  #creates '/tmp/something'
  action :run
end


execute 'change_modConf' do
  command 'chmod -R 0777 /opt/tomcat/conf/*'
    # user 'tomcat'
    # group 'tomcat'
  action :run
end

execute 'change_ownergrp' do
  command 'chown -R tomcat:tomcat /opt/tomcat/*'
  #command 'sudo chown -R tomcat:tomcat /opt/tomcat/*'
  # owner 'tomcat'
  # group 'tomcat'
  action :run
end

template "#{node["service_path"]}/tomcat" do
  source 'tomcat.service.erb'
  owner 'tomcat'
  group 'tomcat'
  mode '0755'
end

# execute 'tomcat_symlink_rc1.d' do
#   command 'sudo ln -s /etc/init.d/tomcat /etc/rc1.d/K99tomcat'
#   action :run
# end

# execute 'tomcat_symlink_rc2.d' do
#   creates 'sudo ln -s /etc/init.d/tomcat /etc/rc2.d/S99tomcat'
#   action :run
# end

# execute 'tomcat_start' do
#   command 'sh /opt/tomcat/bin/startup.sh'
#   #creates '/tmp/something'
#   action :run
# end

service node["service_name"] do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end


file node["cleanup_jre"]do
  action :delete
end

file node["cleanup_jdk"] do
  action :delete
end

file node["directory_tomcat"] do
  action :delete
end
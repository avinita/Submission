#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#



execute "apt-get update" do
	command "apt-get update"
end

package node["package_name"] do
  action :install
end

service node["service_name"] do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end

# cookbook_file "#{document_root}/index.html" do
#   source "index.html"
#   mode "0644"
# end

template "#{node["document_root"]}/index.html" do
  source "index.html.erb"
  mode "0644"
end


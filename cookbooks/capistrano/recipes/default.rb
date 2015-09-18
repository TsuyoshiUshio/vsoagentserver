#
# Cookbook Name:: capistrano
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package "software-properties-common" do
  action :install
end
execute "add-apt-repository ppa:brightbox/ruby-ng" do
  user "root"
end
execute "apt-get update" do
  user "root"
end

package "ruby2.1" do
  action :install
end

execute "gem install capistrano" do
  user "root"
end
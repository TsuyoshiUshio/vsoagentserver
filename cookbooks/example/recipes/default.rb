# This is a Chef recipe file. It can be used to specify resources which will
# apply configuration to a server.

execute "add-apt-repository ppa:openjdk-r/ppa" do
  user "root"
end

execute "apt-get update" do
  user "root"
end

package "gradle" do
  action :install
end

package "openjdk-8-jdk" do
  action :install
end

package "openjdk-8-jre" do
  action :install
end

package "mongodb" do
  action :install
end

execute "curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash -" do
  user "root"
end

package "nodejs" do
  action :install
end

execute "/usr/bin/npm install vsoagent-installer -g" do
  user "root"
end

directory "/home/ubuntu/myagent" do
  owner 'ubuntu'
  group 'ubuntu'
  mode '0755'
  action :create
end

execute "/usr/bin/vsoagent-installer" do
  cwd "/home/ubuntu/myagent"
  user "ubuntu"
  not_if {File.exist?("/home/ubuntu/myagent/agent")}
end

template "/home/ubuntu/.bash_profile" do
  mode '0664'
  source '.bash_profile.erb'
  not_if { File.exist?("/home/ubuntu/.bash_profile")}
end






# For more information, see the documentation: http://docs.getchef.com/essentials_cookbook_recipes.html

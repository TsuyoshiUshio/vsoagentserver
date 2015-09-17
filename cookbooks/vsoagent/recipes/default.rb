# This is a Chef recipe file. It can be used to specify resources which will
# apply configuration to a server.

package "software-properties-common" do
  action :install
end

package "git" do
  action :install
end

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



package "npm" do
  action :install
  not_if {File.exist?("/usr/bin/npm")}
end

execute "update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10" do
  def exist_command?(command)
    begin
      Open3.capture3("type #{command}")[2].exited?
    rescue
      false
    end
  end

  not_if {exist_command?("node")}
end


execute "/usr/bin/npm install vsoagent-installer -g" do
  user "root"
end

directory "/home/#{node["vsoagent"]["vm_user"]}/myagent" do
  owner node["vsoagent"]["vm_user"]
  group node["vsoagent"]["vm_group"]
  mode '0755'
  action :create
end

execute "vsoagent-installer" do
  cwd "/home/#{node["vsoagent"]["vm_user"]}/myagent"
  user node["vsoagent"]["vm_user"]
  group node["vsoagent"]["vm_group"]
  not_if {File.exist?("/home/#{node["vsoagent"]["vm_user"]}/myagent/agent")}
end

template "/home/#{node["vsoagent"]["vm_user"]}/.bash_profile" do
  mode '0664'
  source '.bash_profile.erb'
  user node["vsoagent"]["vm_user"]
  group node["vsoagent"]["vm_group"]
  not_if { File.exist?("/home/#{node["vsoagent"]["vm_user"]}/.bash_profile")}
end

template "/home/#{node["vsoagent"]["vm_user"]}/myagent/.agent" do
  mode '0664'
  source '.agent.erb'
  user node["vsoagent"]["vm_user"]
  group node["vsoagent"]["vm_group"]
  not_if { File.exists?("/home/#{node["vsoagent"]["vm_user"]}/myagent/.agent")}
end







# For more information, see the documentation: http://docs.getchef.com/essentials_cookbook_recipes.html

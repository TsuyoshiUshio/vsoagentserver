require 'chef/provisioning/azure_driver'
with_driver 'azure'

machine_options = {
  :bootstrap_options => {
    :cloud_service_name => 'pendricachefcemo01',
    :storage_account_name => 'pendricachefdemo01',
    :vm_size => "Small",
    :location => 'East Asia'
  },
  :image_id => 'b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04_2-LTS-amd64-server-20150706-en-us-30GB',
  :vm_name => "penchefdemo01",
  :password => "P2ssw0rd"
  }
  machine 'penchefdemo01' do
    machine_options machine_options
    recipe 'example'
    converge true
  end

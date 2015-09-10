# This is a Chef attributes file. It can be used to specify default and override
# attributes to be applied to nodes that run this cookbook.

# Set a default name
default["vsoagent"]["pool_name"] = "demo01pool"
default["vsoagent"]["server_url"] = "https://devopsjapan.visualstudio.com"
default["vsoagent"]["agent_name"] = "demo01agent"
default["vsoagent"]["vm_user"] = "ubuntu"
default["vsoagent"]["vm_group"] = "ubuntu"

# For further information, see the Chef documentation (http://docs.getchef.com/essentials_cookbook_attribute_files.html).

Visual Studio Online Build Agent Machine for Ubuntu
===================================================

Creating Visual Studio Online build agent machine for Ubuntu. Using chef-provision, you can create vm instance and provision it on Azure environment.
This cookbook automate to create a PartsUnlimitedMRP's build server for you.

Prerequisites
-------------

* Azure Subscription
* Azure CLI
* Windows 10 (However, Mac will be almost the same except for Chocolately)
* git

You need to make sure to use Azure CLI with Subscription.

Installation
------------

### 1. Install ChefDK

I use [Chocolatey](https://chocolatey.org/) for deploy something.
To install chocolatey, just type this command.

```
 @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
```
Then you can install ChefDK

```
> choco install chefdk -y
> SETX /M PATH "%PATH%;c:\opscode\chefdk\bin"
> SETX /M PATH "%PATH%;c:\opscode\chefdk\embedded\bin"
> SET PATH=%PATH%;c:\opscode\chefdk\bin;c:\opscode\chefdk\embedded\bin"
```

```
>chef --version
Chef Development Kit Version: 0.7.0
chef-client version: 12.4.1
berks version: 3.2.4
kitchen version: 1.4.2
```

### 2. Install Chef Provisioning Azure

```
> chef gem install chef-provisioning-azure
```

Deploy and Provision
--------------------

```
> git clone https://github.com/TsuyoshiUshio/vsoagentserver.git
> cd vsoagentserver
> chef-client --local provisioning.rb
```

Login the server.

```
> ssh azureuser@pendricachefdemo01.cloudapp.net
password : < See provisioning.rb >
$ cd myagent
$ node agent/vsoagent
```


Customize
---------

You can change the VM related variables on `provisioning.rb` and VSO configuration related
settings on `cookbooks/vsoagent/attributes/default.rb`


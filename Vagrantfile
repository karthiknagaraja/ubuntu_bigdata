# -*- mode: ruby -*-
# vi: set ft=ruby :

ipythonPort = 8001                 # Ipython port to forward (also set in IPython notebook config)

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.define "bigdata_ubuntu" do |master|
    master.vm.box = "ubuntu/trusty64"
    master.vm.box_download_insecure = true
    master.vm.boot_timeout = 900
    master.vm.network :forwarded_port, host: ipythonPort, guest: ipythonPort, auto_correct: true   # IPython port (set in notebook config)
    master.vm.network :forwarded_port, host: 4040, guest: 4040, auto_correct: true                 # Spark UI (Driver)
    master.vm.network :forwarded_port, host: 8080, guest: 8080, auto_correct: true                 # Zeppeline UI (Driver)
    master.vm.network :forwarded_port, host: 10000, guest: 10000, auto_correct: true               # beeline hive jdbc connectin port
    master.vm.network :forwarded_port, guest: 8020, host: 8020
    master.vm.network :forwarded_port, guest: 50070, host: 50070                   #Hadoop DFS status
    master.vm.network :forwarded_port, guest: 50075, host: 50075
    master.vm.network :forwarded_port, guest: 8088, host: 8088                #To know hadoop application status
    master.vm.network :forwarded_port, guest: 8042, host: 8042                #Hadoop Node manager
    master.vm.hostname = "bigdata"
    master.vm.usable_port_range = 4040..4090
    master.vm.synced_folder "../../projects", "/projects"
    master.vm.synced_folder "../../data", "/data"
    master.vm.synced_folder "../../temp_dir", "/temp_dir"
    master.vm.provider :virtualbox do |v|
      v.name = master.vm.hostname.to_s
      v.customize ["modifyvm", :id, "--memory", "3072"]
      v.customize ["modifyvm", :id, "--cpus", "2"] 
    end
    #Provisioning required softwares
    master.vm.provision "shell", path: "setup-ubuntu.sh"
    master.vm.provision "shell", path: "setup-hadoop.sh"
    master.vm.provision "shell", path: "setup-mysql.sh"
    master.vm.provision "shell", path: "setup-hive.sh"
    master.vm.provision "shell", path: "setup-pig.sh"
    master.vm.provision "shell", path: "setup-spark.sh"
    master.vm.provision "shell", path: "setup-zeppelin.sh"

  end
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  #config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end

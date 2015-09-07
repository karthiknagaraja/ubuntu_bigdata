# Hadoop Stack on ubuntu using Vagrant

This vagrant setup would help you to spin up a ubuntu linux virtual machine and pull necessary hadoop stack for your quick development.

Hadoop, Yarn, Spark, Hbase are going to be standalone mode in this setup.

Vagrant setup uses 3GB memory and 2 cores in your machine. Please make sure sufficient computing resources are available in your laptop/desktop.

Vagrantfile has following host directories synced into virtual machine. If you bring up vagrant as is, it would fail due to that. Please add/delete/update and make necessary change according to your needs.

```
master.vm.synced_folder "../../projects", "/projects"
master.vm.synced_folder "../../data", "/data"
master.vm.synced_folder "../../temp_dir", "/temp_dir"
master.vm.synced_folder "../../softwares", "/softwares"
master.vm.synced_folder "../../eclipse_workspace", "/eclipse_workspace"

```
Once virutal machine image is up and running, 'vagrant ssh' would help you to login into the virtual machine. Please run following command to bring up all necessary hadoop yarn and hbase daemons. It is mandatory. Otherwise, you would be able to run any hadoop hdfs commands and pig,hive would not work properly.

Please run the following command once you login into the image.

```
/vagrant/post_process.sh
```

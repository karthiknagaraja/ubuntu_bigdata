#!/bin/bash
source "/vagrant/common.sh"


echo I am provisioning mysql...
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server
apt-get -y -q install mysql-server
apt-get -y -q install mysql-client
#yum install mysql-connector-java -y

/etc/init.d/mysql start
mysql  -h localhost -u root --password=root  -e "create user 'hive'@'localhost' identified by 'hive';"
mysql  -h localhost -u root --password=root  -e "create user 'hive'@'127.0.0.1' identified by 'hive';"
mysql  -h localhost -u root --password=root -e "create user 'hive'@'bigdata' identified by 'hive';"
mysql  -h localhost -u root --password=root  -e "create database hivemetastore;"
mysql  -h localhost -u root --password=root -e "GRANT ALL ON hivemetastore.* TO 'hive'@'localhost' IDENTIFIED BY 'hive';"
mysql  -h localhost -u root --password=root  -e "GRANT ALL ON hivemetastore.* TO 'hive'@'127.0.0.1' IDENTIFIED BY 'hive';"
mysql  -h localhost -u root --password=root  -e "GRANT ALL ON hivemetastore.* TO 'hive'@'bigdata' IDENTIFIED BY 'hive';"
mysql  -h localhost -u root --password=root  -e "FLUSH PRIVILEGES;"
#echo "bind-address=0.0.0.0" >> /etc/my.cnf
echo "mysqld: ALL: allow" >> /etc/hosts.allow
/etc/init.d/mysql restart

#!/bin/bash

#apt-get -y -q update
#apt-get -y -q upgrade
apt-get -y -q install software-properties-common htop
apt-get -y -q install dos2unix

add-apt-repository ppa:webupd8team/java -y
apt-get -y -q update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
apt-get -y -q install oracle-java8-installer
apt-get -y -q install oracle-java7-installer
update-java-alternatives -s java-8-oracle
apt-get -y  -q install ssh
apt-get -y -q install rsync

echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf
sysctl -p

ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
chmod u+rw ~/.ssh/authorized_keys
#eval `ssh-agent -s`
#ssh-add ~/.ssh/id_dsa

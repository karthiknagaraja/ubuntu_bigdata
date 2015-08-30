#!/bin/bash
source "/vagrant/common.sh"

# SSH
cd
ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
chmod u+rw ~/.ssh/authorized_keys
eval `ssh-agent -s`
ssh-add ~/.ssh/id_dsa

# HDFS
$HADOOP_PREFIX/bin/hdfs namenode -format -force

#List here required hdfs directories to be created

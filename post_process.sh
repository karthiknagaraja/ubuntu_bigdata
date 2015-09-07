#!/bin/bash

#Run this program after vagrant image is created, login into the vagrant image. Then, run this script from unix login prompt
$HADOOP_PREFIX/sbin/start-dfs.sh
$HADOOP_PREFIX/sbin/start-yarn.sh
$ZEPPELIN_HOME/bin/zeppelin-daemon.sh start
$HBASE_HOME/bin/start-hbase.sh
nohup $HIVE_HOME/bin/hiveserver2 &

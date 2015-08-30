#!/bin/bash
source "/vagrant/common.sh"

function installLocalZeppelin {
	echo "install zeppelin from local file"
	FILE=/vagrant/resources/$ZEPPELIN_ARCHIVE
	tar -xzf $FILE -C /usr/local
}

function installRemoteZeppelin {
	echo "install zeppelin from remote file"
	curl -o /vagrant/resources/$ZEPPELIN_ARCHIVE -O -L $ZEPPELIN_MIRROR_DOWNLOAD
	tar -xzf /vagrant/resources/$ZEPPELIN_ARCHIVE -C /usr/local
}

function setupZeppelin {
	echo "setup zeppelin"
	#mkdir /usr/local/zeppelin
	#mkdir /usr/local/zeppelin/conf
	chmod -R 777 /usr/local/zeppelin
	#cp -f /vagrant/resources/zeppelin/slaves /usr/local/zeppelin/conf
	cp -f /vagrant/resources/zeppelin/zeppelin-env.sh /usr/local/zeppelin/conf
	#cp -f /vagrant/resources/zeppelin/hive-site.xml /usr/local/zeppelin/conf
	#Make Spark less verbose
	#cp -f /vagrant/resources/zeppelin/log4j.properties /usr/local/zeppelin/conf
}

function setupEnvVars {
	echo "creating zeppelin environment variables"
	cp -f $ZEPPELIN_RES_DIR/zeppelin.sh /etc/profile.d/zeppelin.sh
}

function installZeppelin {
	if resourceExists $ZEPPELIN_ARCHIVE; then
		installLocalZeppelin
	else
		installRemoteZeppelin
	fi
	ln -s /usr/local/$ZEPPELIN_DIR /usr/local/zeppelin
}

echo "setup zeppelin"

installZeppelin
setupZeppelin
setupEnvVars

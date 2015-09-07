#!/bin/bash
source "/vagrant/common.sh"

function installLocalHBase {
	echo "install HBase from local file"
	FILE=/vagrant/resources/$HBASE_ARCHIVE
	tar -xzf $FILE -C /usr/local
}

function installRemoteHBase {
	echo "install HBase from remote file"
	curl -o /vagrant/resources/$HBASE_ARCHIVE -O -L $HBASE_MIRROR_DOWNLOAD
	tar -xzf /vagrant/resources/$HBASE_ARCHIVE -C /usr/local
}

function setupHBase {
	echo "setup HBase"
	mkdir
	#cp -f /vagrant/resources/hbase/slaves /usr/local/hbase/conf
	#cp -f /vagrant/resources/hbase/hbase-env.sh /usr/local/hbase/conf
}

function setupEnvVars {
	echo "creating HBase environment variables"
	cp -f $HBASE_RES_DIR/hbase.sh /etc/profile.d/hbase.sh
}

function installHBase {
	if resourceExists $HBASE_ARCHIVE; then
		installLocalHBase
	else
		installRemoteHBase
	fi
	ln -s /usr/local/$HBASE_VERSION /usr/local/hbase
	chmod 777 -R /usr/local/hbase
}

echo "setup HBase"

installHBase
#setupHBase
setupEnvVars

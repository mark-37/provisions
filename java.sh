#!/usr/bin/env bash

#installing Oracle Java 11

JAVA_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' $JAVA | grep "install ok installed")

echo "Checking for $JAVA: $JAVA_INSTALLED"

if [ "" == "$JAVA_INSTALLED" ]; then

    echo oracle-java11-installer shared/accepted-oracle-license-v1-2 select true | sudo /usr/bin/debconf-set-selections
    echo oracle-java11-installer shared/accepted-oracle-licence-v1-2 boolean true | sudo /usr/bin/debconf-set-selections

    echo "deb http://ppa.launchpad.net/linuxuprising/java/ubuntu bionic main" | tee /etc/apt/sources.list.d/linuxuprising-java.list
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 73C3DB2A
    apt-get update
    apt-get install -y oracle-java11-installer oracle-java11-set-default


fi

echo "Everying set and done..!"

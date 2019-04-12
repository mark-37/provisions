#!/usr/bin/env bash

# Packages
NODE="nodejs"
BUILD_ESSENTIAL="build-essential"
MONGO="mongodb-org"
GIT="git"
YARN="yarn"
JAVA="oracle-java11-installer"
ANGULAR="@angular/cli"

# Prerequisites
GIT_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' $GIT | grep "install ok installed")
echo "Checking for $GIT: $GIT_INSTALLED"
if [ "" == "$GIT_INSTALLED" ]; then
 apt-get update
 apt-get install -y $GIT
fi

# MongoDB
MONGO_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' $MONGO | grep "install ok installed")
echo "Checking for $MONGO: $MONGO_INSTALLED"

if [ "" == "$MONGO_INSTALLED" ]; then
 apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
 echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
 apt-get update
 apt-get install -y mongodb-org
 sudo mkdir /data
fi

# Node.js
NODE_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' $NODE | grep "install ok installed")
echo "Checking for $NODE: $NODE_INSTALLED"
if [ "" == "$NODE_INSTALLED" ]; then
 
 apt-get update
 
 curl -sL https://deb.nodesource.com/setup_8.x | bash -
 apt-get install -y nodejs build-essential
 npm install -g n
 n lts

 npm install --no-bin-links
 npm rebuild --no-bin links

fi

YARN_INSTALLED=$(npm list --depth 1 --parseable=true --global yarn > /dev/null 2>&1)
echo "Checking for $YARN: $YARN_INSTALLED"

if [ "" == "$YARN_INSTALLED" ]; then
 npm install -g yarn
fi

ANGULAR_INSTALLED=$(npm list --depth 1 --parseable=true --global $ANGULAR > /dev/null 2>&1)
echo "Checking for $ANGULAR: $ANGULAR_INSTALLED"

if [ "" == "$ANGULAR_INSTALLED" ]; then
 npm install -g @angular/cli@7.0.3
fi

mkdir workspace
echo "########### WORKSPACE CREATED ###########"

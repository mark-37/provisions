#!/usr/bin/env bash

MYSQL_ROOT_PASS="admin"

# Installing dependencies

sudo apt-get install python-software-properties software-properties-common
sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

# Updating repository

sudo apt-get -y update

# Installing Apache

sudo apt-get -y install apache2

# Installing PHP

sudo apt-get install php7.0 php7.0-fpm php7.0-mysql -y

# Installing Mysql

sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'

sudo apt-get install mysql-server -y

# Installing PHPMyAdmin

debconf-set-selections <<< "phpmyadmin phpmyadmin/internal/skip-preseed boolean true"
debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect"
debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean false"

sudo apt-get install phpmyadmin -y

# Setting permissions

sudo chown 755 -R /var/www

# Setting up phpmyadmin

echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf

# Restarting Services

sudo service apache2 restart

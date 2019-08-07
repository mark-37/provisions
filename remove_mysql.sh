# A script to remove mysql from the system

echo "***********REMOVING MYSQL!!!***********"

#1
sudo apt-get remove --purge mysql*

#2
sudo apt-get purge mysql*

#3
sudo apt-get autoremove

#4
sudo apt-get autoclean

#5
sudo apt-get remove dbconfig-mysql

#6
sudo apt-get dist-upgrade

echo "***********REMOVED***********"
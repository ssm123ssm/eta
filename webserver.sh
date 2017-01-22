#!/bin/bash

#### ziping the content of html and exporting
dir=$(pwd)
cd /var/www
tar -zcvf $dir/tmp/html/html.tar html
clear
printf "Current root directory is archived and exported to $dir/tmp/html/html.tar\n"
sleep 1
####

#### Emptying html directory
rm -rf html
####

#### Copying captive portal
cp -r $dir/webserver /var/www
mv /var/www/webserver /var/www/html
cp $dir/core/htaccess /var/www/html/.htaccess
chmod 777 /var/www/html
sleep 1
####


#### Backing up apache config file
cp /etc/apache2/apache2.conf $dir/tmp/apache2/apache2.conf_backup
####


#### copying the apache config to captive portal
cp $dir/core/apache2.conf /etc/apache2/apache2.conf
a2enmod rewrite
sleep 2
####

#### restarting apache server
service apache2 restart
####

clear

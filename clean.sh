#!/bin/bash

### Killer

dir=$(pwd)

clear

echo " Cleaning..."

kill $(ps aux | grep '[a]irbase' | awk '{print $2}')
wait
kill $(ps aux | grep '[d]nsmasq' | awk '{print $2}')
airmon-ng stop wlan0mon
service network-manager restart
echo 0 > /proc/sys/net/ipv4/ip_forward

#rm /etc/dnsmasq.conf
mv tmp/dnsmasq/conf_backup /etc/dnsmasq.conf

mv tmp/html/html.tar /var/www/html.tar
rm -rf /var/www/html
cd /var/www
tar -xf /var/www/html.tar
rm /var/www/html.tar

printf "Restoring apache config file...\n"
mv $dir/tmp/apache2/apache2.conf_backup /etc/apache2/apache2.conf
sleep 1
echo "Done restoring..."
sleep 1

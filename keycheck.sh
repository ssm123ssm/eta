#!/bin/bash

while [ ! -f /var/www/html/key.txt ]; do
	sleep 3
done
clear
echo " key found !"
echo -e "\a"
sleep .3
echo -e "\a"
sleep .3
echo -e "\a"

cp /var/www/html/key.txt key.txt
cat key.txt 

printf "\n\n" &

gnome-terminal -e ./clean.sh
	


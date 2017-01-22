#!/bin/bash

apache=$(which apache2)
dnsmasq=$(which dnsmasq)
airbase=$(which airbase-ng)
airmon=$(which airmon-ng)

c=0

if [ ! $apache == "" ]
then 
	c="$(($c+1))"
else
	echo "Apache not installed"
fi


if [ ! $dnsmasq == "" ]
then 
	c="$(($c+1))"
else
	echo "Dnsmasq not installed"
fi

if [ ! $airbase == "" ]
then 
	c="$(($c+1))"
else
	echo "Airbase-ng not installed"
fi

if [ ! $airmon == "" ]
then 
	c="$(($c+1))"
else
	echo "Airmon-ng not installed"
fi



if [ ! $c == "$((4))" ]
then
	echo "Please install the missing software first."
else
	./eta.sh
fi




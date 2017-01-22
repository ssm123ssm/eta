# eta
An Evil Twin Attacker

IMPORTANT!
Please backup apache2.config (/etc/apache2/apache2.conf), Dnsmasq.config (/etc/dnsmasq.conf) and all your files at /var/www before using this application. 
Clean.sh is executed by keycheck.sh. Don't start it manually.

This creates an evil twin of a wifi access point and directs all the web requests to a webserver run on the attacker machine.
(Like a captive portal)
It asks the victim to enter the passphrase to re-establish connection, captures it and records in a key.txt file. Then the fake AP goes down itself.

Web server is run by Apache, DNS and DHCP configuration by Dnsmasq and fake AP by Airbase-ng.


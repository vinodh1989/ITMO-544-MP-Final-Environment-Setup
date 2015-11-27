#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y apache2 git php5 php5-curl mysql-client curl php5-mysql &> /tmp/installation-setup.txt

git clone https://github.com/vinodh1989/ITMO-544-MP2-Application-Setup.git

sudo mv ./ITMO-544-MP2-Application-Setup/images /var/www/html/images
sudo mv ./ITMO-544-MP2-Application-Setup/css /var/www/html/css
sudo mv ./ITMO-544-MP2-Application-Setup/js /var/www/html/js
sudo mv ./ITMO-544-MP2-Application-Setup/index.html /var/www/html
sudo mv ./ITMO-544-MP2-Application-Setup/*.php /var/www/html

curl -sS https://getcomposer.org/installer | sudo php &> /tmp/getcomposer.txt

sudo php composer.phar require aws/aws-sdk-php &> /tmp/runcomposer.txt

sudo mv vendor /var/www/html &> /tmp/movevendor.txt

sudo php /var/www/html/setup.php &> /tmp/database-setup.txt

echo "Hello!" > /tmp/hello.txt
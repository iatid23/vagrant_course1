#!/bin/bash

# Update CentOs with any patches 
yum update -y --exclude=kernel

# Tools
yum install -y nano git unzip screen

# Apache
yum install -y httpd httpd-devel httpd-tools
sudo systemctl enable httpd 
sudo systemctl start httpd 
sudo systemctl status httpd
sudo systemctl stop httpd

rm -rf /var/www/html
ln -s /vagrant /var/www/html

sudo setenforce 0
sestatus
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload

sudo systemctl start httpd

# PHP
yum install -y php php-devel php-cli php-common 

# MySQL
yum install -y mysql mysql-devel mysql-server
sudo systemctl enable mysqld 
sudo systemctl start mysqld 
sudo systemctl status mysqld

mysql -u root -e "SHOW DATABASES";

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/iatid23/vagrant_course1/refs/heads/main/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/iatid23/vagrant_course1/refs/heads/main/files/info.php



sudo systemctl restart httpd


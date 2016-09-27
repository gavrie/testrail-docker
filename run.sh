#!/bin/bash -e

/etc/init.d/mysql start
/etc/init.d/apache2 start

echo "CREATE DATABASE testrail DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root
echo "CREATE USER 'testrail'@'localhost' IDENTIFIED BY 'newpassword';" | mysql -u root
echo "GRANT ALL ON testrail.* TO 'testrail'@'localhost';" | mysql -u root

sleep infinity

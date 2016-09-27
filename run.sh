#!/bin/bash -e

mkdir /var/www/html/testrail/logs
chown www-data /var/www/html/testrail/logs

echo '* * * * * www-data /usr/bin/php /var/www/html/testrail/task.php' > /etc/cron.d/testrail

/etc/init.d/mysql start
/etc/init.d/apache2 start

echo "CREATE DATABASE testrail DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root
echo "CREATE USER 'testrail'@'localhost' IDENTIFIED BY 'newpassword';" | mysql -u root
echo "GRANT ALL ON testrail.* TO 'testrail'@'localhost';" | mysql -u root

sleep infinity

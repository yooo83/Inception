#!/bin/sh

if [ ! -f "/home/ygaiero/mariadb/ib_buffer_pool" ]; then
#initialize the db main mysql database, and the data dir as standardized
#to /var/lib/mysql. This can be done by executing the rc script below.
/etc/init.d/mariadb setup
#start the service
rc-service mariadb start
#auto-completion
printf "\n Y\n Y\n ${MYSQL_ROOT_PASSWORD}\n${MYSQL_ROOT_PASSWORD}\n Y\n Y\n Y\n Y\n" | mysql_secure_installation
#createdb and add privileges (with grand option == can give privileges)

mysql -e "CREATE DATABASE ${MYSQL_DATABASE};CREATE USER '${MYSQL_USER_ADMIN}'@localhost IDENTIFIED BY '${MYSQL_PASSWORD_ADMIN}';GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER_ADMIN}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD_ADMIN}' WITH GRANT OPTION;FLUSH PRIVILEGES;"

echo "MariaDB installed."
fi

exec mysqld --user=root
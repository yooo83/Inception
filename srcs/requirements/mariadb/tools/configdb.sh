#!/bin/sh

if [ ! -d "/var/lib/mysql/db" ]; then
#createdb and add privileges (with grand option == can give privileges)
mysql -e "CREATE DATABASE ${MYSQL_DATABASE};CREATE USER '${MYSQL_USER_ADMIN}'@localhost IDENTIFIED BY '${MYSQL_PASSWORD_ADMIN}';GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER_ADMIN}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD_ADMIN}' WITH GRANT OPTION;FLUSH PRIVILEGES;"
mv ./etc/mariadb-server.cnf ./etc/my.conf.d/
echo "MariaDB installed."
fi

exec mysqld --user=root
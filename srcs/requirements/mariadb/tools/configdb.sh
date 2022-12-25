#!/bin/sh

if [ ! -d "/var/lib/mysql/db" ]; then
	#initialize the db main mysql database, and the data dir as standardized
	#to /var/lib/mysql. This can be done by executing the rc script below.
	/etc/init.d/mariadb setup
	#start the service
	mv ./etc/mariadb-server.cnf ./etc/my.cnf.d/
	rc-service mariadb start 
	#createdb and add privileges (with grand option == can give privileges)
	mysql -e "CREATE DATABASE ${MYSQL_DATABASE};CREATE USER '${MYSQL_USER_ADMIN}'@localhost IDENTIFIED BY '${MYSQL_PASSWORD_ADMIN}';GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER_ADMIN}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD_ADMIN}' WITH GRANT OPTION;FLUSH PRIVILEGES;"
	echo "MariaDB installed."
else
	rc-service mariadb start
fi

exec mysqld --user=root
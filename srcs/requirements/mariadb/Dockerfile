FROM alpine:3.16

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER_ADMIN
ARG MYSQL_PASSWORD_ADMIN

RUN apk update && \
	apk add mariadb mariadb-client openrc && \
	#to handle openrc errors on alpine 3.16
	openrc && touch ./run/openrc/softlevel && \
	#initialize the db main mysql database, and the data dir as standardized
	#to /var/lib/mysql. This can be done by executing the rc script below.
	/etc/init.d/mariadb setup && \
	#start the service
	rc-service mariadb start && \
	#auto-completion
	printf "\n Y\n Y\n ${MYSQL_ROOT_PASSWORD}\n${MYSQL_ROOT_PASSWORD}\n Y\n Y\n Y\n Y\n" | mysql_secure_installation && \
	#createdb and add privileges (with grand option == can give privileges)
	mysql -e "CREATE DATABASE ${MYSQL_DATABASE};CREATE USER '${MYSQL_USER_ADMIN}'@localhost IDENTIFIED BY '${MYSQL_PASSWORD_ADMIN}';GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER_ADMIN}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD_ADMIN}' WITH GRANT OPTION;FLUSH PRIVILEGES;"

COPY /conf/mariadb-server.cnf ./etc/my.cnf.d
CMD ["mysqld", "--user=root"]



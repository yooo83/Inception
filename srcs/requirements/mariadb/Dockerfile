FROM alpine:3.16

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
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
	#createdb
	mysql -e "CREATE DATABASE ${MYSQL_DATABASE};CREATE USER ${MYSQL_USER} IDENTIFIED BY '${MYSQL_PASSWORD}';"

CMD ["mysqld", "--user=root"]



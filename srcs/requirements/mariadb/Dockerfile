FROM alpine:3.16

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER_ADMIN
ARG MYSQL_PASSWORD_ADMIN

COPY /conf/mariadb-server.cnf ./etc/my.cnf.d
COPY /tools/configdb.sh ./bin/

RUN apk update && chmod 777 /bin/configdb.sh && \
	apk add mariadb mariadb-client openrc && \
	#to handle openrc errors on alpine 3.16
	openrc && touch ./run/openrc/softlevel && \
	#initialize the db main mysql database, and the data dir as standardized
	#to /var/lib/mysql. This can be done by executing the rc script below.
	/etc/init.d/mariadb setup && \
	#start the service
	rc-service mariadb start && \
	#auto-completion
	printf "\n Y\n Y\n ${MYSQL_ROOT_PASSWORD}\n${MYSQL_ROOT_PASSWORD}\n Y\n Y\n Y\n Y\n" | mysql_secure_installation
	

ENTRYPOINT [ "/bin/configdb.sh" ]



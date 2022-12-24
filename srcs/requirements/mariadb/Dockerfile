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
	openrc && touch ./run/openrc/softlevel
	

ENTRYPOINT [ "/bin/configdb.sh" ]



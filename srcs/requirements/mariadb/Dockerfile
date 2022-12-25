FROM alpine:3.16

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER_ADMIN
ARG MYSQL_PASSWORD_ADMIN

COPY /tools/configdb.sh ./bin/
COPY /conf/mariadb-server.cnf /etc

RUN apk update && \
	apk add mariadb mariadb-client openrc && \
	#to handle openrc errors on alpine 3.16
	openrc && touch ./run/openrc/softlevel


ENTRYPOINT ["/bin/configdb.sh"]



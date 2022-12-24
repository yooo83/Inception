FROM alpine:3.16

COPY /tools/config.sh ./bin/

RUN apk update && apk add php php-fpm php-phar mariadb-client wget openrc && chmod 777 /bin/config.sh && \
	#all dependances for wp php https://wiki.alpinelinux.org/wiki/WordPress
	apk add php-common php-session php-iconv php-json php-gd php-curl php-xml php-mysqli php-imap php-cgi fcgi php-pdo php-pdo_mysql php-soap php-posix php-gettext php-ldap php-ctype php-dom php-simplexml

ENTRYPOINT ["/bin/config.sh"]
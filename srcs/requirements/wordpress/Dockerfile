FROM alpine:3.16

COPY /tools/config.sh ./bin/

RUN apk update && apk add php php-fpm php-phar mariadb-client wget openrc && chmod 777 /bin/config.sh && \
	#all dependances for wp php https://wiki.alpinelinux.org/wiki/WordPress
	apk add php-common php-session php-iconv php-json php-gd php-curl php-xml php-mysqli php-imap php-cgi fcgi php-pdo php-pdo_mysql php-soap php-posix php-gettext php-ldap php-ctype php-dom php-simplexml
	# #dl the cli for inline command install wordpress
	# wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	# #cli need to be executable
	# chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && \
	# #dl wp && extract && move on www/ && add permissions
	# wget https://fr.wordpress.org/latest-fr_FR.tar.gz && tar -xf latest-fr_FR.tar.gz && \
	# rm -rf latest-fr_FR.tar.gz && mkdir -p var/www/wordpress && mv wordpress var/www/ && \
	# chmod 777 ./bin/config.sh && chmod 777 ./var/www/wordpress
	
#CMD tail -f
ENTRYPOINT ["/bin/config.sh"]
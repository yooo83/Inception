#!/bin/sh

#dl wp cli
if [ ! -f "/var/www/wordpress/index.php" ]; then 
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#cli need to be executable
chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

#dl wp && extract && move on www/ && add permissions
wget https://fr.wordpress.org/latest-fr_FR.tar.gz && tar -xf latest-fr_FR.tar.gz -C /var/www
rm -rf ./latest-fr_FR.tar.gz
chmod 777 /var/www/wordpress

while ! mysqladmin status --host mariadb --user=$MYSQL_USER_ADMIN --password=$MYSQL_PASSWORD_ADMIN --silent; do
	echo "Waiting DB response..."
	sleep 1
done
#create a config.php
wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER_ADMIN --dbpass=$MYSQL_PASSWORD_ADMIN --dbhost=mariadb:3306 --locale=fr_FR --path='/var/www/wordpress'

# #install wp
wp core install --allow-root --url=localhost --title="Ygaiero Website" \
		--path='/var/www/wordpress' --admin_user=$MYSQL_USER_ADMIN \
		--admin_email=test@test.com --skip-email --admin_password=$MYSQL_PASSWORD_ADMIN
sed -i "s/127.0.0.1:9000/9000/g" /etc/php8/php-fpm.d/www.conf

wp user create --allow-root $MYSQL_USER test@test.test --role="subscriber" --user_pass=$MYSQL_USER_PASSWORD --path='/var/www/wordpress'
echo "Wordpress installed."
fi

exec php-fpm8 -F
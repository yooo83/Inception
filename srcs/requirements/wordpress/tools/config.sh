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

#create a config.php
wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306 --locale=fr_FR --path='/var/www/wordpress'


# #install wp
wp core install --allow-root --url=localhost --title="Mon site Wordpress" --path='/var/www/wordpress' --admin_user=mederis --admin_email=mederis@grosteub.com --skip-email
sed -i "s/127.0.0.1:9000/9000/g" /etc/php8/php-fpm.d/www.conf
echo "le taf est finit morray"
fi

exec php-fpm8 -F
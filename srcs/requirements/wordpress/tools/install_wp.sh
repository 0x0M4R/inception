#!/bin/sh
# if [! -f "/usr/local/bin/wp/wp-cli.phar"];then
#   echo "WP-CLI not found, downloading  ..."
#   curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#   chmod +x wp-cli.phar
#   mv wp-cli.phar /usr/local/bin/wp
# fi
# if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then
    echo "== Installing and setting up Wordpress =="
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    cd /var/www/html/wordpress
    wp core download --path=/var/www/html/wordpress --allow-root
    wp config create --path=/var/www/html/wordpress --allow-root --dbname=$MARIADB_DATABASE --dbhost=$MARIADB_HOSTNAME --dbprefix=wp_ --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD
    wp core install --path=/var/www/html/wordpress --allow-root --url=$DOMAIN_NAME --title="$WP_SITE_TITLE" --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
    # wp plugin update --path=/var/www/html/wordpress --allow-root --all
    wp user create --path=/var/www/html/wordpress --allow-root $WP_USER_NAME $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD
    wp --allow-root theme install shapely --activate
    
    wp config set WP_CACHE true --allow-root
	wp config set WP_CACHE_KEY_SALT $REDIS_KEY --allow-root
	wp config set WP_REDIS_HOST $REDIS_HOST --allow-root
	wp config set WP_REDIS_PORT $REDIS_PORT --allow-root
    wp plugin install redis-cache --activate --allow-root
    wp redis enable --allow-root

# fi
# wp plugin install wp-file-manager --activate --allow-root
# Set the owner of the content of our site to www-data user and group
# For security reasons, we want to restrict who has access to these files
mkdir -p /run/php/
php-fpm7.3 -F -R
#!/bin/bash
cd /var/www/wordpress

wp core download --allow-root > /dev/null 2>&1

until mariadb -h mariadb -u $DB_USER_NAME -p"$DB_USER_PASSWORD" -e "SELECT 1" > /dev/null 2>&1; do
    echo "Waiting for MariaDB..."
    sleep 1
done

wp config create \
    --dbname="$DB_NAME" \
    --dbuser="$DB_USER_NAME" \
    --dbpass="$DB_USER_PASSWORD" \
    --dbhost="mariadb" \
    --allow-root > /dev/null 2>&1

wp core install \
    --url="$DOMAIN_NAME" \
    --title="$SITE_TITLE" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASSWORD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --allow-root > /dev/null 2>&1

wp user create "$WP_USER_NAME" $WP_USER_EMAIL \
    --user_pass="$WP_USER_PASS" \
    --role="editor" \
    --allow-root > /dev/null 2>&1

wp config set WP_REDIS_HOST "redis" --allow-root --path=/var/www/html
# Configure WordPress to use the Redis container as caching backend

if ! wp redis status --allow-root --path=/var/www/html | grep -q "Connected"; then
    wp redis enable --allow-root --path=/var/www/html
    # Enable Redis caching if WordPress is not yet connected to Redis
fi

exec php-fpm8.2 --nodaemonize

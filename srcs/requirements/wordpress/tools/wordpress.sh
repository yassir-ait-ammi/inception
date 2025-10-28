#!/bin/bash
cd /var/www/wordpress

# Download WordPress core
wp core download --allow-root > /dev/null 2>&1

# Wait for MariaDB
until mariadb -h mariadb -u $DB_USER_NAME -p"$DB_USER_PASSWORD" -e "SELECT 1" > /dev/null 2>&1; do
    echo "Waiting for MariaDB..."
    sleep 1
done

# Create wp-config.php
wp config create \
    --dbname="$DB_NAME" \
    --dbuser="$DB_USER_NAME" \
    --dbpass="$DB_USER_PASSWORD" \
    --dbhost="mariadb" \
    --allow-root > /dev/null 2>&1

# Install WordPress
wp core install \
    --url="$DOMAIN_NAME" \
    --title="$SITE_TITLE" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASSWORD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --allow-root > /dev/null 2>&1

# Create additional user
wp user create "$WP_USER_NAME" $WP_USER_EMAIL \
    --user_pass="$WP_USER_PASS" \
    --role="editor" \
    --allow-root > /dev/null 2>&1

# Add Redis configuration to wp-config.php
if ! grep -q "WP_REDIS_HOST" /var/www/wordpress/wp-config.php; then
    echo "Adding Redis configuration to wp-config.php..."
    
    sed -i "/That's all, stop editing/i \
define('WP_REDIS_HOST', 'redis');\n\
define('WP_REDIS_PORT', 6379);\n\
define('WP_REDIS_TIMEOUT', 1);\n\
define('WP_REDIS_READ_TIMEOUT', 1);\n\
define('WP_REDIS_DATABASE', 0);\n\
define('WP_CACHE', true);\n" /var/www/wordpress/wp-config.php
    
    echo "Redis configuration added!"
fi

# Install and activate Redis Object Cache plugin
if [ ! -d /var/www/wordpress/wp-content/plugins/redis-cache ]; then
    echo "Installing Redis Object Cache plugin..."
    wp plugin install redis-cache --activate --allow-root --path=/var/www/wordpress > /dev/null 2>&1
    echo "Redis plugin installed!"
fi

# Enable Redis object cache
if ! wp redis status --allow-root --path=/var/www/wordpress 2>/dev/null | grep -q "Connected"; then
    echo "Enabling Redis cache..."
    wp redis enable --allow-root --path=/var/www/wordpress 2>/dev/null || true
    echo "Redis cache enabled!"
fi

# Start php-fpm
exec php-fpm8.2 --nodaemonize
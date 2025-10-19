FROM debian:12
WORKDIR /var/www/wordpress

# Install PHP, FPM, and MariaDB client
RUN apt-get update && apt-get install -y php8.2 php8.2-fpm php-mysql mariadb-client curl less procps

# Install WP-CLI
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/bin/wp
RUN chmod +x /usr/bin/wp

# Configure PHP-FPM to listen on port 9000
RUN sed -i 's/listen = .*/listen = 0.0.0.0:9000/' /etc/php/8.2/fpm/pool.d/www.conf

# Copy the WordPress setup script
COPY ./tools/wordpress.sh /etc/wordpress.sh
RUN chmod +x /etc/wordpress.sh

# Run the setup script
CMD ["/etc/wordpress.sh"]
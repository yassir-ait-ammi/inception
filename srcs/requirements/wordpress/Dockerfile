FROM debian:12
WORKDIR /var/www/wordpress

RUN apt-get update && apt-get install -y php8.2 php8.2-fpm php-mysql mariadb-client curl less procps

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/bin/wp
RUN chmod +x /usr/bin/wp

RUN sed -i 's/listen = .*/listen = 0.0.0.0:9000/' /etc/php/8.2/fpm/pool.d/www.conf

COPY ./tools/wordpress.sh /etc/wordpress.sh
RUN chmod +x /etc/wordpress.sh

CMD ["/etc/wordpress.sh"]
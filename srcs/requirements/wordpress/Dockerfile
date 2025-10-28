# start the image from the scratch 
FROM debian:12

# change dir 
WORKDIR /var/www/wordpress

# run a command 
RUN apt-get update && apt-get install -y php8.2 php8.2-fpm php-mysql mariadb-client curl less procps

# downoad from github
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/bin/wp
#run a command
RUN chmod +x /usr/bin/wp
#run a command
RUN sed -i 's/listen = .*/listen = 0.0.0.0:9000/' /etc/php/8.2/fpm/pool.d/www.conf

# copy file into the container
COPY ./tools/wordpress.sh /etc/wordpress.sh
# run a command
RUN chmod +x /etc/wordpress.sh

# this in this will be the main PID1
CMD ["/etc/wordpress.sh"]
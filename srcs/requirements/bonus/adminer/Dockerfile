# image from scratch
FROM debian:12

# run a command
RUN apt update && apt install -y php php-mysql curl \
    && rm -rf /var/lib/lists/*

# run a command
RUN mkdir -p /var/www/html

# run a command
RUN curl -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -o /var/www/html/index.php

# open 8080
EXPOSE 8080

#main PID1
CMD [ "php", "-S", "0.0.0.0:8080", "-t", "/var/www/html" ]
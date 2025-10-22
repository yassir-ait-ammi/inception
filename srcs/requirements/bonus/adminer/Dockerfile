FROM debian:12

RUN apt update && apt install -y php php-mysql curl \
    && rm -rf /var/lib/lists/*

RUN mkdir -p /var/www/html

RUN curl -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -o /var/www/html/index.php

EXPOSE 8080


CMD [ "php", "-S", "0.0.0.0:8080", "-t", "/var/www/html" ]
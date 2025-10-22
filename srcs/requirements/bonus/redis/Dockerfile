FROM debian:12

RUN  apt update &&  apt install redis-server php-redis -y \
            && rm -rf /var/lib/apt/lists/*

COPY conf/redis.conf /etc/redis/redis.conf

EXPOSE 6379

CMD [ "redis-server", "/etc/redis/redis.conf" ]
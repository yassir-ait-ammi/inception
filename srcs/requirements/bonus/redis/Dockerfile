# start image from the scratch
FROM debian:12

#run a command
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y redis-server redis-tools && \
    rm -rf /var/lib/apt/lists/*

#run a command
RUN mkdir -p /run/redis && chmod 755 /run/redis

#run a command
RUN cp /etc/redis/redis.conf /etc/redis/redis.conf.bak

# open 6379
EXPOSE 6379

# copy into conatiner 
COPY tools/redis.sh /redis.sh

# run a command
RUN chmod +x /redis.sh

# main PID1
CMD ["/redis.sh"]
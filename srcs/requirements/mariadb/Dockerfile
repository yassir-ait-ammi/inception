# start the image from the scratch
FROM debian:12

# run a command 
RUN apt-get update && apt-get install -y mariadb-server mariadb-client

# copy into container 
COPY ./tools/script.sh /etc/script.sh

# run a command 
RUN chmod +x /etc/script.sh

# change dir
WORKDIR /etc

# this will be the main PID1
ENTRYPOINT ["./script.sh"]

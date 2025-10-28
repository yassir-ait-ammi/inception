# start image from scratch
FROM debian:12

# change the dir
WORKDIR /etc/nginx/

#run a command
RUN apt update -y && apt install -y openssl nginx

#run a command
RUN mkdir -p /etc/srv-prv/
# copy inside container
COPY ./conf/nginx.conf ./

#run a command
RUN openssl req -x509 -nodes \
    -keyout /etc/srv-prv/nginx_ssl.key \
    -out /etc/srv-prv/nginx_ssl.crt \
    -days 365 \
    -subj "/C=MA/ST=NON/L=NON/O=1337/OU=IT/CN=yaait-am.42.fr/UID=INV"

# this will be the main PID1 int this case
CMD ["nginx", "-g", "daemon off;"]

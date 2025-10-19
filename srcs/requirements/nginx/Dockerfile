FROM debian:12

WORKDIR /etc/nginx/

RUN apt update -y && apt install -y openssl nginx

RUN mkdir -p /etc/srv-prv/

COPY ./conf/nginx.conf ./

# Generate SSL certificate
RUN openssl req -x509 -nodes \
    -keyout /etc/srv-prv/nginx_ssl.key \
    -out /etc/srv-prv/nginx_ssl.crt \
    -days 365 \
    -subj "/C=MA/ST=NON/L=NON/O=1337/OU=IT/CN=yaait-am.42.fr/UID=INV"

# Start Nginx in the foreground (required for Docker)
CMD ["nginx", "-g", "daemon off;"]

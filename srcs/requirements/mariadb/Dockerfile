FROM debian:12

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server mariadb-client

# Copy initialization script
COPY ./tools/script.sh /etc/script.sh
RUN chmod +x /etc/script.sh

WORKDIR /etc

# Run the initialization script
ENTRYPOINT ["./script.sh"]

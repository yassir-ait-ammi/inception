FROM debian:12


RUN apt-get update && apt-get install -y mariadb-server mariadb-client

COPY ./tools/script.sh /etc/script.sh

RUN chmod +x /etc/script.sh

WORKDIR /etc

ENTRYPOINT ["./script.sh"]

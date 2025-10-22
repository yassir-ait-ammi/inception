FROM debian:12

RUN apt update && apt install -y vsftpd ftp \
    && rm -rf /var/lib/apt/lists/*

COPY conf/vsftp.conf /etc/vsftpd.conf

COPY tools/ftp.sh /usr/local/bin/ftp.sh
RUN chmod +x /usr/local/bin/ftp.sh

RUN mkdir -p /var/www/wordpress

EXPOSE 20 21 21100-21110

CMD ["/usr/local/bin/ftp.sh"]
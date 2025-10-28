# image from scratch
FROM debian:12

# run a command
RUN apt update && apt install -y vsftpd ftp \
    && rm -rf /var/lib/apt/lists/*

# copy into container
COPY conf/vsftp.conf /etc/vsftpd.conf

# copy into container
COPY tools/ftp.sh /usr/local/bin/ftp.sh

# run a command
RUN chmod +x /usr/local/bin/ftp.sh

# run a command
RUN mkdir -p /var/www/wordpress

# open ports for ftp
EXPOSE 21 21100-21110
# one for command for ftp

# main PID1
CMD ["/usr/local/bin/ftp.sh"]
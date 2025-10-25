#!/bin/bash

mkdir -p /var/run/vsftpd/empty
mkdir -p /var/www/wordpress

if ! id -u $FTP_USER > /dev/null 2>&1; then
    useradd -d /var/www/wordpress -M $FTP_USER
    echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
fi

chown -R $FTP_USER:$FTP_USER /var/www/wordpress

exec /usr/sbin/vsftpd /etc/vsftpd.conf
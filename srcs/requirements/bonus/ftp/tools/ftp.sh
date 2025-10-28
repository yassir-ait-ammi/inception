#!/bin/bash

# creat dirs
mkdir -p /var/run/vsftpd/empty
mkdir -p /var/www/wordpress

# add usser (-u for user)
if ! id -u $FTP_USER > /dev/null 2>&1; then
    # (-d for home dir and -M for not creating it)
    useradd -d /var/www/wordpress -M $FTP_USER
    echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
fi

# make the user is the user for all (-R recursive)
chown -R $FTP_USER:$FTP_USER /var/www/wordpress

#main PID1
exec /usr/sbin/vsftpd /etc/vsftpd.conf
#!/bin/bash
mariadb-install-db --user=mysql > /dev/null 2>&1

chown -R mysql:mysql /var/lib/mysql

sed -i 's/bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

mysqld_safe &

until mariadb -e "SELECT 1" > /dev/null 2>&1; do
    echo "Waiting for MariaDB..."
    sleep 1
done

mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';"
mariadb -e "FLUSH PRIVILEGES;"

mysqladmin shutdown

exec mysqld_safe
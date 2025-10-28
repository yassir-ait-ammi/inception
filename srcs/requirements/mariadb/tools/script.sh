#!/bin/bash
# add mysql as new user
mariadb-install-db --user=mysql > /dev/null 2>&1

# make the file here owned by mysql
chown -R mysql:mysql /var/lib/mysql

# change in the conf file for reason (i in_place)
sed -i 's/bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# run mysql int backround
mysqld_safe &

# (-e) excute
until mariadb -e "SELECT 1" > /dev/null 2>&1; do
    echo "Waiting for MariaDB..."
    sleep 1
done

# mariadb conf
mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';"
mariadb -e "FLUSH PRIVILEGES;"

# close mariadb
mysqladmin shutdown

# restart mariadb
exec mysqld_safe
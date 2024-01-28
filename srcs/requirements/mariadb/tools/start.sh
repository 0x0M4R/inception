#!/bin/sh
# echo $MARIADB_DATABASE
# echo "$MARIADB_USER"
# echo ${MARIADB_DATABASE}
# echo "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;GRANT ALL PRIVILEGES ON *.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';FLUSH PRIVILEGES;"
if [ ! -d "/var/lib/mysql/wordpress" ]; then
    service mariadb start 
    echo "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;GRANT ALL PRIVILEGES ON *.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';FLUSH PRIVILEGES;" | mysql -uroot -p$MARIADB_PASSWORD
    echo "database created"
    service mariadb stop 
fi
runuser -u mysql -- mysqld --bind-address=0.0.0.0

# runuser -l  mysql -c 'mysqld --bind-address=0.0.0.0'
# fi

#mysqld --console --bind-address=0.0.0.0
# sed -i 's/bind-address .*=.*/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
# sed -i '/^#port/c\port = 3306' /etc/mysql/mariadb.conf.d/50-server.cnf

# service mariadb start
#enter current root password:
#switch to unix_socket:
#change root pass :
#enter pass:
#reenter pass:
#Remove anonymous users
#disallow remote root login
#remove test db
#reload priviledge now

# mysql_secure_installation << _EOF_

# n
# Y
# rooter
# rooter
# Y
# n
# Y
# Y
# _EOF_

# grant privilidges to all tables to root
# echo "GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';" | mysql -u root -p$MARIADB_ROOT_PASSWORD

# create wordpress database
# create additional user and password and grant privelidges to wordpress database
# if [ ! -d "/var/lib/mysql/wordpress" ]; then
#     echo "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;GRANT ALL PRIVILEGES ON *.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';FLUSH PRIVILEGES;" | mysql -u root -p$MARIADB_ROOT_PASSWORD
# fi
#echo "CREATE DATABASE IF NOT EXISTS worpress; GRANT ALL ON wordpress.* TO 'oabdalla'@'localhost' IDENTIFIED BY 'db1234'; FLUSH PRIVILEGES;" | mysql -u root
# mysql -uroot  -e "CREATE DATABASE $DB_NAME; GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS'; 	   FLUSH PRIVILEGES;"
#   echo "wordpress database created "
#Import database in the mysql command line
#mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql

# service mariadb stop

# mysqld --console -uroot
# mysqld --console
#exec "$@"
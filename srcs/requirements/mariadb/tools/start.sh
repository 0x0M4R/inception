#!/bin/sh
service mariadb start

#enter current root password:
#switch to unix_socket:
#change root pass :
#enter pass:
#reenter pass:
#Remove anonymous users
#disallow remote root login
#remove test db
#reload priviledge now
mysql_secure_installation << _EOF_

n
Y
rooter
rooter
Y
n
Y
Y
_EOF_

# grant privilidges to all tables to root
echo "GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';" | mysql -u root -p$MARIADB_ROOT_PASSWORD

# create wordpress database
# create additional user and password and grant privelidges to wordpress database
echo "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;" | mysql -u root -p$MARIADB_ROOT_PASSWORD
echo "GRANT ALL ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'localhost' IDENTIFIED BY '$MARIADB_PASSWORD';" | mysql -u root -p$MARIADB_ROOT_PASSWORD
#echo "CREATE DATABASE IF NOT EXISTS worpress; GRANT ALL ON wordpress.* TO 'oabdalla'@'localhost' IDENTIFIED BY 'new1234'; FLUSH PRIVILEGES;" | mysql -u root

#Import database in the mysql command line
#mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql

#service mariadb stop

#exec "$@"
#install mariadb
FROM debian:bookworm

#*update the package list to ensure no out-of-date package when installing
RUN apt-get update

# upgrade to latest packages
RUN apt-get upgrade

#*install mariadb "-y" to skip prompt
RUN apt-get install -y mariadb-server

#apt list --installed

#*you are missing permission to create /var/run/mysqld directory.So please create and give permission as following.

RUN mkdir -p /var/run/mysqld
RUN chown mysql:mysql /var/run/mysqld

COPY ./tools/start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

EXPOSE 3306

ENTRYPOINT [ "/usr/local/bin/start.sh" ]
CMD ["mysqld", "--bind-address=0.0.0.0"]
#check mariadb service
#service mariadb status
#RUN service mariadb start 

#to protect access to server : 
#RUN mysql_secure_installation && Y $MARIADB_ROOT_PASSWORD $MARIADB_ROOT_PASSWORD Y n Y Y _EOF_
# go through prompts and set root password

# grant privilidges to all tables to root
#RUN echo "GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';" | mysql -uroot

# create wordpress database
# create additional user and password and grant privelidges to wordpress database
#RUN echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root
#echo "CREATE DATABASE IF NOT EXISTS worpress; GRANT ALL ON wordpress.* TO 'oabdalla'@'localhost' IDENTIFIED BY 'new1234'; FLUSH PRIVILEGES;" | mysql -u root

#RUN service mysql stop
# ADD sql/ /docker-entrypoint-initdb.d

# RUN apt-get update && apt-get -y install vim

# EXPOSE 3306

# CMD ["mysqld"]
# set up users 
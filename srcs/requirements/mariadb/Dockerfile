FROM debian:bookworm

RUN apt-get update && apt-get upgrade \
    && apt-get install -y mariadb-server

# RUN chmod 777 /var/lib/mysql
RUN mkdir -p run/mysqld
RUN chown mysql:mysql run/mysqld

COPY ./tools/start.sh /temp/
# RUN chmod +x /usr/local/bin/start.sh
# RUN chmod 777 etc/mysql 

# RUN chmod 777 /var/lib/mysql
# RUN chown -R mysql:mysql /var/lib/mysql

EXPOSE 3306
# RUN echo "CREATE DATABASE IF NOT EXISTS MARIADB_DATABASE}';GRANT ALL PRIVILEGES ON *.* TO '/$MARIADB_USER'@'%' IDENTIFIED BY '\$MARIADB_PASSWORD';FLUSH PRIVILEGES;"
# RUN sh /usr/local/bin/start.sh
# ARG CACHEBUST=3

# ENV MARIADB_DATABASE = $MARIADB_DATABASE
# RUN service mariadb start \
#     && mysqladmin -u root password "\$MARIADB_ROOT_PASSWORD" \ 
#     && mysql -e    "CREATE DATABASE IF NOT EXISTS '$MARIADB_DATABASE';GRANT ALL PRIVILEGES ON *.* TO '/$MARIADB_USER'@'%' IDENTIFIED BY '\$MARIADB_PASSWORD';FLUSH PRIVILEGES;" \
#     && service mariadb stop 

# # RUN mysqladmin -u root password "$MARIADB_ROOT_PASSWORD"
# USER mysql
ENTRYPOINT ["sh","/temp/start.sh" ]
# CMD ["mysqld", "--bind-address=0.0.0.0"]
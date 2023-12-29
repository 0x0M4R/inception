FROM debian:buster

RUN apt-get update && apt-get -y install  \
php \
#for db
php-mysql \
#process manager
php-fpm \
# interface for php web app
php-cgi 

#php-cli


#mkdir -p /run/php

#install wordpress

# wget http://wordpress.org/latest.tar.gz
# tar xfz latest.tar.gz
# mv wordpress/* .
# # rm -rf latest.tar.gz
# # rm -rf wordpress
# cp wp-config-sample.php wp-config.php

mkdir -p /run/php

# EXPOSE 9000

FROM debian:buster

RUN apt-get update && apt-get -y install  \
php \
php-cli \
#for db
php-mysql \
#process manager
php-fpm \
curl \
unzip \
wget
#less \
#dumb-init
RUN mkdir -p /var/www/html/wordpress
RUN wget https://wordpress.org/latest.zip
RUN unzip latest.zip -d /var/www/html/

COPY ./tools/wp-config.php /var/www/html/wordpress

RUN chown -R www-data:www-data /var/www/html/wordpress/
# make sure volume is clean !!!!
#download wordpress
#curl -O https://wordpress.org/latest.zip

#unzip latest.zip -d /var/www/html/

#mkdir -p /var/www/html/wordpres
#chown -R www-data:www-data /var/www/html/wordpress/
#tar xzvf latest.tar.gz  --directory /var/www/html/

#sudo apt-get install unzip


# interface for php web app
#php-cgi 

# Install the wordpress CLI. This isn't a package that we can install via apt,
# so we need to download it off github and set it to executable
# RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp \
# 	&& chmod +x /usr/local/bin/wp
#php-cli


# RUN mkdir -p /var/www/html/wordpress


# COPY ./tools/install_wp.sh /tmp/

# COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# EXPOSE 9000

# ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
# CMD ["/bin/bash", "/tmp/install_wp.sh" ]

#mkdir -p /run/php

#install wordpress

# wget http://wordpress.org/latest.tar.gz
# tar xfz latest.tar.gz
# mv wordpress/* .
# # rm -rf latest.tar.gz
# # rm -rf wordpress
# cp wp-config-sample.php wp-config.php

#mkdir -p /run/php

# EXPOSE 9000

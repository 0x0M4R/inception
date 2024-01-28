FROM debian:buster

RUN apt-get update && apt-get -y install  \
php-fpm \
curl \
#for db
php-mysql \
ftp
#process manager
# unzip \
# wget
#less \
#dumb-init
#START FPM
RUN mkdir -p /var/www/html/wordpress
# RUN wget https://wordpress.org/latest.zip
# RUN unzip latest.zip -d /var/www/html/

#copy config files from host to container
# COPY ./tools/wp-config.php /var/www/html/wordpress
COPY ./tools/php-fpm.conf /etc/php/7.3/fpm
ARG CACHEBUST=3
COPY ./tools/install_wp.sh /temp/
#nginx requires www-data owns directory
RUN chown -R www-data:www-data /var/www/html/wordpress/

EXPOSE 9000

#start php every time container starts
# RUN mkdir -p /run/php
ENTRYPOINT ["sh","/temp/install_wp.sh"]
#CMD ["service", "php7.3-fpm", "start"]
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

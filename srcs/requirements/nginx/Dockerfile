FROM debian:buster

RUN apt-get update 
RUN apt-get upgrade
RUN apt-get -y install nginx \
openssl 
#&& rm -rf /var/lib/apt/lists/*

#Generate a self certificate
RUN mkdir /etc/nginx/ssl
#sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 
#-keyout /etc/ssl/private/nginx-selfsigned.key 
#-out /etc/ssl/certs/nginx-selfsigned.crt
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/oabdalla.42.fr.chained.crt \
    -keyout /etc/nginx/ssl/oabdalla.42.fr.key \
    -subj "/C=AE/ST=Abu Dhabi/L=Abu Dhabi/O=42 Abu Dhabi/OU=oabdalla/CN=oabdalla"

#Copy the new configuration inside nginx
#COPY conf/nginx.conf /etc/nginx/conf.d
COPY conf/nginx.conf /etc/nginx/sites-available/default

#RUN mkdir -p /run/nginx


# add 127.0.0.1 oabdalla.42.fr to host file and on host machine

EXPOSE 443
#start nginx in foreground when container starts
CMD ["nginx", "-g", "daemon off;"]
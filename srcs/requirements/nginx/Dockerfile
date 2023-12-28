#Precise with what our image will be built
FROM debian:buster

#Install nginx with RUN
RUN apt-get update && apt-get -y install nginx \
openssl 
#&& rm -rf /var/lib/apt/lists/*

#Generate a self certificate
RUN mkdir /etc/nginx/ssl
#sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 
#-keyout /etc/ssl/private/nginx-selfsigned.key 
#-out /etc/ssl/certs/nginx-selfsigned.crt
# RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
#     -out /etc/nginx/ssl/oabdalla.crt \
#     -keyout /etc/ssl/oabdalla.key \
#     -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=oabdalla/CN=oabdalla"
#     #.42.fr"

#Copy the new configuration inside nginx
#COPY conf/nginx.conf /etc/nginx/conf.d
COPY conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

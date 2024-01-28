ARG FTP_USER
ARG FTP_PASS
FROM debian:buster

RUN apt-get update && apt-get install -y vsftpd ftp

# RUN useradd $FTP_USER && echo "$FTP_USER:$FTP_PASS" | chpasswd \
#     && usermod -aG www-data $FTP_USER

RUN mkdir -p /var/run/vsftpd/empty
ARG CACHEBUST=3
COPY ./tools/install.sh /tmp/
COPY ./tools/vsftpd.conf /etc/vsftpd.conf
# ARG CACHEBUST=3
# RUN echo $FTP_USER

# RUN mkdir /home/oabdalla

EXPOSE 21

# CMD ["vsftpd"]
ENTRYPOINT ["sh","/tmp/install.sh"]
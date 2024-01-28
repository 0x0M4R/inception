#!/bin/sh
useradd $FTP_USER && echo "$FTP_USER:$FTP_PASS" | chpasswd 
usermod -aG www-data $FTP_USER
mkdir /home/$FTP_USER
vsftpd  /etc/vsftpd.conf
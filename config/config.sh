#!/bin/sh

# Variable Environtment
TIME_ZONE="Asia/Jakarta"
PHP_FPM_USER="www-data"
PHP_FPM_GROUP="www-data"
COMPOSER_ALLOW_SUPERUSER=1

ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime
echo $TIME_ZONE > /etc/timezone

chown -R ${PHP_FPM_USER}:${PHP_FPM_GROUP} /var/lib/nginx
sed -i "s|user nginx;|user ${PHP_FPM_USER};|g" /etc/nginx/nginx.conf

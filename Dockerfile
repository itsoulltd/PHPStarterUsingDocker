FROM php:7.2-apache
MAINTAINER lab.infoworks.com

#Now deploy project src to /var/www/html
ADD src /var/www/html
EXPOSE 80
RUN apt-get update \
    && apt-get install -y libmcrypt-dev \
    && pecl install mcrypt-1.0.2 \
    && docker-php-ext-enable mcrypt \
    && docker-php-ext-install mysqli \
    && a2enmod headers \
    && a2enmod rewrite \
    && service apache2 restart
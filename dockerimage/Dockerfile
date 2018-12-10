# Dockerfile of Chamilo

FROM php:5.6-apache

MAINTAINER opsforge.io
LABEL name="chamilo"
LABEL version="0.1.0"

EXPOSE 80

RUN apt-get update && \
    apt-get install wget libicu-dev libjpeg-dev libpng-dev libfreetype6-dev -y && \
    apt-get clean

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) pdo_mysql intl gd zip

COPY php-lms.ini /usr/local/etc/php/php.ini
COPY init.sh /root/init.sh

RUN chmod 0755 /root/init.sh

WORKDIR /tmp

COPY php/chamilo-1.11.6 /var/www/html

WORKDIR /var/www/html
RUN ls -al
RUN chown -R www-data:www-data /var/www/html
#RUN chmod -R +w /var/www/html/app
#RUN chmod -R +w /var/www/html/web
#RUN chmod -R +w /var/www/html//main/default_course_document/images/

CMD ["/root/init.sh"]

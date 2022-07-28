# based on https://github.com/chrisns/scrumonline

# build scrumonline
FROM php:7.4.11-cli-alpine as builder

COPY . /scrumonline

RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/master/web/installer -O - -q | php --
# RUN wget https://getcomposer.org/download/1.4.2/composer.phar
RUN php composer.phar self-update --1
RUN php composer.phar install -n -d /scrumonline

RUN touch /scrumonline/src/sponsors.php

RUN mv /scrumonline/src/sample-config.php /scrumonline/src/config.php
COPY config.php /tmp
RUN cat /tmp/config.php >> /scrumonline/src/config.php



# build the web frontend
FROM php:7.4.19-apache
ENV DB_NAME=scrum_online
ENV DB_USER=root
ENV DB_PASS=passwd
ENV DB_HOST=127.0.0.1
ENV HOST="http://localhost:80"

RUN a2enmod rewrite

RUN docker-php-ext-install pdo_mysql

WORKDIR /scrumonline

COPY --from=builder /scrumonline /scrumonline 

RUN rm -r /var/www/html && \
  ln -s /scrumonline/src/ /var/www/html

# MySQL setup

RUN apt-get update && \
  apt-get install -y default-mysql-server && \
  apt-get clean

COPY mysql.cnf /etc/mysql/conf.d/mysql-hack.cnf
COPY mysql_init.sh /scrumonline/

RUN ./mysql_init.sh

CMD mysqld_safe & apache2-foreground
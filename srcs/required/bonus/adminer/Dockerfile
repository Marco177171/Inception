FROM alpine:latest

# install prerequisites
# https://wordpress.com/support/php-environment/
RUN apk update && apk upgrade
RUN apk add --no-cache \
	curl \
	less \
	mariadb-client \
	php \
	php-fpm \
	php-common \
	php-json \
	php-gd \
	php-curl \
	php-xml \
	php-imap \
	php-soap \
	php-gettext \
	php-ldap \
	php-ctype \
	php-dom

#RUN the adminer part, create html directory, move the adminer directory and add user

RUN curl -L -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
RUN mkdir -p /var/www/html
RUN mv ./adminer-4.8.1.php /var/www/html/index.php
RUN adduser -u 82 -D -S -G www-data www-data

COPY /conf/www.conf /etc/php/php-fpm.d/www.conf

EXPOSE 9000
STOPSIGNAL SIGQUIT

CMD ["/usr/sbin/php-fpm", "-F"]
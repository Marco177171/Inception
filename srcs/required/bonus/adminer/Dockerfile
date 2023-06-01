FROM alpine:latest

# install prerequisites
# https://wordpress.com/support/php-environment/
RUN apk update && \
  	apk add \
	curl \
	less \
	mariadb-client \
	php \
	php-fpm \
	php-common \
	php-session \
	php-iconv \
	php-json \
	php-gd \
	php-curl \
	php-xml \
	php-mysqli \
	php-imap \
	php-pdo \
	php-pdo_mysql \
	php-soap \
	php-posix \
	php-gettext \
	php-ldap \
	php-ctype \
	php-dom \
	php-simplexml

#RUN the adminer part, create html directory, move the adminer directory and add user

RUN \
	curl -L -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
	mkdir -p /var/www/html && \
	mv ./adminer-4.8.1.php /var/www/html/index.php && \
	adduser -u 82 -D -S -G www-data www-data

COPY /conf/www.conf /etc/php/php-fpm.d/www.conf

EXPOSE 9000
STOPSIGNAL SIGQUIT

CMD ["/etc/php-fpm", "-F", "-R"]
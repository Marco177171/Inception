FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
	wget \
	curl \
	bash \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-gd \
	php-cli \
	php-mbstring \
	redis \
	php-redis
RUN rm -rf /var/lib/apt/lists/*

# install wp_cli and put it in the right dir in bin
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# copy the configuration file in the www directory
COPY ./conf/www.conf /etc/php/8.1/fpm/pool.d

# create the folder to enable php start
RUN mkdir -p /run/php

# copy the shell script to create and launch wordpress
COPY ./srcs/create_wordpress.sh /usr/local/bin
RUN chmod +x /usr/local/bin/create_wordpress.sh
ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

# set 'html' as the working directory
WORKDIR /var/www/html

# export 9000 port
EXPOSE 9000

# launch php fpm in foreground, ignoring daemonize from configuration file
CMD ["/usr/sbin/php-fpm7.3", "-F"]

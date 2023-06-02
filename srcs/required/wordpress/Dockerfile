FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
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
    php-redis \
    && rm -rf /var/lib/apt/lists/*

# Install wp_cli and put it in the right dir in bin
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Copy the configuration file to the appropriate directory
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

# Create the folder to enable PHP start
RUN mkdir -p /run/php

# Copy the shell script to create and launch WordPress
COPY ./srcs/create_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wordpress.sh

# Set 'html' as the working directory
WORKDIR /var/www/html

# Export port 9000
EXPOSE 9000

# Launch PHP-FPM in foreground, ignoring daemonize from configuration file
CMD ["/usr/sbin/php-fpm", "-F"]
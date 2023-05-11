FROM debian:buster

# update and install all dependencies
RUN apt update && apt upgrade -y
RUN apt install -y nginx openssl

# set SSL connection
RUN mkdir /etc/nginx/ssl


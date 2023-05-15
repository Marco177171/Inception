FROM debian:buster

# update and install all dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nginx openssl

# set SSL connection
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \	
	-out /etc/nginx/ssl/masebast.crt \
	-keyout /etc/nginx/ssl/masebast.key \
	-subj "/C=IT/ST=Rome/L=Rome/O=42 School/OU=masebast/CN=masebast/"

COPY ./conf/nginx.conf /etc/nginx/conf.d
COPY ./index.html /var/www/html/index.html

# nginx config
RUN mkdir -p /run/nginx

# expose port
EXPOSE 443

# run nginx
CMD ["nginx", "-g", "daemon off;"]

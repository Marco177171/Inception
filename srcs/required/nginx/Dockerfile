FROM debian:buster

#install all the program
RUN apt-get update
RUN apt-get install -y nginx openssl

# nginx SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/masebast.crt \
	-keyout /etc/nginx/ssl/masebast.key \
	-subj "/C=FR/ST=Rome/L=Rome/O=42 School/OU=masebast/CN=masebast/"

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN chmod 644 /etc/nginx/ssl/*

# nginx config
RUN mkdir -p /run/nginx

#the only port allowed
EXPOSE 443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y redis
RUN rm -rf /var/lib/apt/lists/*

COPY ./srcs/redis.sh /tmp/redis.sh

EXPOSE 6379

CMD ["sh", "/tmp/redis.sh"]

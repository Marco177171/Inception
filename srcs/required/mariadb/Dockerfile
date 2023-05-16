FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server \
	mariadb-client vim
RUN rm -rf /var/lib/apt/lists/*

# allow to run the daemon of mysql
# purge and re-create /var/run/mysqld with appropriate ownership
# ensure that /var/run/mysqld (used for socket and lock files) is writeable regardless of the UID our mysqld instance ends up having at runtime
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN chmod 777 /var/run/mysqld

EXPOSE 3306

# copy the .sh and the .sql int /bin to run the program
# grant right to execute and launch .sh
COPY ./srcs/mariadb.sh /usr/local/bin/
COPY ./conf/wordpress.sql /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh
RUN chmod +x /usr/local/bin/wordpress.sql

ENTRYPOINT ["usr/local/bin/mariadb.sh"]

# launch mariadb and enable the database to listen globally
CMD ["mysqld", "--bind-address=0.0.0.0"]

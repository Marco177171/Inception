mysql_install_db
/etc/init.d/mysql start

# check if the db exists already
if [-d "/var/lib/mysql/$MYSQL_DATABASE"]
then
	echo "Database already exists"
else
	# set root option to enable password protected connection
	mysql_secure_installation << _EOF_
Y
root4life
root4life
Y
n
Y
Y
_EOF_

# Add a root user on 127.0.0.1
# Flush privileges allow to your sql tables to be automatically updated when modified
echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES" | mysql -uroot

# Create database and user in the db for wordpress
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root

# import database in the mysql command line
mysql -uroot -p $MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql

fi

/etc/init.d/mysql stop

exec "$@"

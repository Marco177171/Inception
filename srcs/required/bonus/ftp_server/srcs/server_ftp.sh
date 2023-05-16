if [! -f "/etc/vsftpd/vsftpd.conf.bak"];
then
	mkdir -p /var/www/html

	cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
	mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf

	# add a user, change his password and declare him king of everything
	adduser $FTP_USER --disabled-password
	echo "$FTP_USER:$FTP_PWD" | /usr/sbin/chpasswd &> /dev/null
fi

echo "FTP started on :21"
usr/sbin/vsftpd /etc/vsftpd/vsftpd.con
usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

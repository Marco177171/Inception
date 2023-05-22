FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add --no-cache vsftpd

COPY ./conf/vsftpd.conf /tmp/vsftpd.conf
COPY ./srcs/server_ftp.sh /tmp/server_ftp.sh

ENTRYPOINT ["sh", "/tmp/server_ftp.sh"]

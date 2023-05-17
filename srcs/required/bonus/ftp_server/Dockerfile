FROM alpine:latest

RUN apk update && apk upgrade -y
RUN apk add --no-cache -y vsftpd

COPY ./conf/vsftpd.conf /tmp/vsftpd.conf
COPY ./srcs/server_ftp.sh /tmp/server_ftp.sh

ENTRYPOINT ["sh", "/tmp/server_ftp.s/tmp/server_ftp.sh"]

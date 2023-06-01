FROM alpine:latest

WORKDIR /var/hugo/me

RUN apk update && apk upgrade
RUN apk add --update --no-cache hugo git shadow
RUN rm -f /var/cache/apk/*

RUN hugo new site /var/hugo/me
RUN cd /var/hugo/me
RUN git clone https://github.com/vaga/hugo-theme-m10c themes/m10c
RUN hugo -b https://masebast.42.fr/me

COPY ./conf/config.toml /var/hugo/me/cofig.toml

EXPOSE 1313

CMD ["hugo", "server", "--bind=0.0.0.0", "baseURL=https://masebast.42.fr/me", "-p", "1313", "--logFile=/dev/stdout", "--appendPort=false"]
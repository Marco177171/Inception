FROM    alpine:latest

WORKDIR /var/hugo/static

RUN apk update && apk upgrade -y
RUN apk add hugo git shadow
RUN rm -f /var/cache/apk/

# create new hugo site
RUN hugo new site /var/hugo/static
RUN cd /var/hugo/static
RUN git clone https://github.com/vaga/hugo-theme-m10c themes/m10c
RUN hugo new posts/presentation.md
RUN hugo -b https://masebast.42.it/static
RUN mkdir -p /var/hugo/me/content/about

COPY ./conf/config.toml /var/hugo/static/config.toml
COPY conf/presentation.md /var/hugo/static/content/posts/presentation.md
COPY conf/about.md /var/hugo/static/content/about/index.md

EXPOSE 1313

CMD ["hugo", \
	"server", \
	"--bind=0.0.0.0", \
	"--baseURL=https://vbachele.42.fr/static", \
	"-p", \
	"1313", \
	"--logFile=/dev/stdout", \
	"--appendPort=false"]

FROM nodejscn/node:latest

ENV DOCK_HOST="WAPP-HOST" VERSION=1.0 MAINTAINER="a0z9@rambler.ru"

WORKDIR /var/wapp 

EXPOSE 8080

COPY wapp.js .

ENTRYPOINT ["node","wapp.js"]

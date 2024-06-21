FROM nodejscn/node:latest


ENV DOCK_HOST="WAPP-HOST"

WORKDIR /var/wapp 

EXPOSE 8080

COPY wapp.js .

ENTRYPOINT ["node","wapp.js"]



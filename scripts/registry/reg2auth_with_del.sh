#!/bin/bash

docker run --name registry2 -d -p 5002:5000 -v /home/student/docker/certs:/certs -v /home/student/docker/auth:/auth \
-e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/my.crt -e REGISTRY_HTTP_TLS_KEY=/certs/my.key \
-e REGISTRY_AUTH=htpasswd \
-e REGISTRY_AUTH_HTPASSWD_REALM="Registry Realm" \
-e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd \
-e REGISTRY_STORAGE_DELETE_ENABLED=true --restart=always registry:2

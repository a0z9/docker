## Настройка сетевого реестра без регистрации.

## A. Узел dock01.

``` bash

0. mkdir -p ~/docker/certs && cd ~/docker

1. openssl req -newkey rsa:4096 -nodes -sha256 -keyout certs/my.key -x509 -days 3650 -out certs/my.crt -addext 'subjectAltName=DNS:dock01'

2. sudo mkdir -p /etc/docker/certs.d/dock01:5001

3. sudo cp certs/my.crt /etc/docker/certs.d/dock01\:5001/ca.crt

4. sudo service docker restart

5. docker run --name registry -d -p 5001:5000 -v /home/student/docker/certs:/certs -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/my.crt -e REGISTRY_HTTP_TLS_KEY=/certs/my.key --restart=always registry:2

6. scp certs/my.crt dock02:/home/student/ca.crt

7. docker tag local_image dock01:5001/image:tag

8. docker push dock01:5001/image:tag
```

## B. Узел dock02.

``` shell
1. sudo apt install ssh -y

2. sudo mkdir -p /etc/docker/certs.d/dock01:5001

3. sudo cp ca.crt /etc/docker/certs.d/dock01\:5001/ca.crt

4. sudo service docker restart

5. docker pull dock01:5001/image:tag
```

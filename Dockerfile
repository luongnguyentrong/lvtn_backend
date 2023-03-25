FROM debian:buster

RUN apt-get update -y && apt-get install -y certbot

docker run -it --rm --name certbot \
-v ${PWD}:/letsencrypt \
-v ${PWD}/certs:/etc/letsencrypt \
certbot bash
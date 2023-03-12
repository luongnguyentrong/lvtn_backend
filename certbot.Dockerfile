FROM alpine:3.17.2
RUN apt-get update && apt-get install -y snapd
RUN snapd install --classic certbot
RUN ln -s /snap/bin/certbot /usr/bin/certbot
RUN snap install certbot-dns-digitalocean
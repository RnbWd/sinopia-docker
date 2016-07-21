FROM  mhart/alpine-node:0.10

MAINTAINER David Wisner <dwisner6@gmail.com>

RUN apk update && apk upgrade && apk add git && adduser -D -S -s /bin/bash -h /sinopia sinopia

USER sinopia

RUN git clone --depth 1 https://github.com/rnbwd/sinopia  /sinopia/registry

ADD config.yaml /sinopia/registry/config.yaml

WORKDIR /sinopia/registry

RUN npm install --production && npm cache clean

# VOLUME /sinopia/storage
EXPOSE 4873
CMD ["./bin/sinopia"]




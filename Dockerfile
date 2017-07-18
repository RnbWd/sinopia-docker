FROM  node:alpine

MAINTAINER David Wisner <dwisner6@gmail.com>

RUN apk update && apk upgrade && apk add git && adduser -D -S -s /bin/sh -h /sinopia sinopia

USER sinopia

RUN git clone --depth 1 https://github.com/rnbwd/sinopia  /sinopia/registry

ADD config.yaml /sinopia/registry/config.yaml

WORKDIR /sinopia/registry

RUN npm install --production

VOLUME /sinopia/storage
EXPOSE 4873
CMD ["./bin/sinopia"]

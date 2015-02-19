# Pull base image.
FROM node:slim

MAINTAINER RnbWd <dwisner6@gmail.com>

# Sinopia Version / Path / Backup

ENV version v1.0.1

RUN git clone https://github.com/rlidwka/sinopia.git
WORKDIR /sinopia
RUN git checkout $version
RUN npm install --production

# Clean

RUN rm -rf .git
RUN npm cache clean

ADD config.yaml /sinopia/config.yaml

CMD ["./bin/sinopia"]

EXPOSE 4873

VOLUME /sinopia/storage

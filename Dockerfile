# Pull base image.
FROM rnbwd/node-io:latest

MAINTAINER RnbWd <dwisner6@gmail.com>

# Sinopia Version / Path / Backup

ENV version v1.4.0

RUN git clone https://github.com/RnbWd/sinopia.git
WORKDIR /sinopia
# RUN git checkout $version
RUN npm install --production

# Clean

RUN rm -rf .git
RUN npm cache clean

ADD config.yaml /sinopia/config.yaml

CMD ["./bin/sinopia"]

EXPOSE 4873

VOLUME /sinopia/storage

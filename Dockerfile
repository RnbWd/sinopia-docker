# Pull base image.
FROM rnbwd/node-io:latest

MAINTAINER RnbWd <dwisner6@gmail.com>

# Sinopia Version / Path / Backup
RUN git clone --depth 1 https://github.com/RnbWd/sinopia.git
WORKDIR /sinopia
RUN npm install --production

# Clean

RUN npm cache clean

# Set to non-privileged user
# USER daemon

ADD config.yaml /sinopia/config.yaml
CMD ["./bin/sinopia"]

EXPOSE 4873

VOLUME /sinopia/storage

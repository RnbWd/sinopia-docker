# Pull base image.
FROM rnbwd/node-io:0.10.44

MAINTAINER RnbWd <dwisner6@gmail.com>

# Sinopia Version / Path / Backup
RUN git clone --depth 1 https://github.com/RnbWd/sinopia.git

WORKDIR sinopia

RUN npm install --production && npm cache clean

COPY /config.yaml config.yaml
# non privledged user
# USER daemon
EXPOSE 4873

CMD ["./bin/sinopia"]

VOLUME /sinopia/storage



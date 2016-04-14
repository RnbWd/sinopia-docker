# Pull base image.
FROM rnbwd/node-io:latest

MAINTAINER RnbWd <dwisner6@gmail.com>

# Sinopia Version / Path / Backup
RUN git clone --depth 1 https://github.com/RnbWd/sinopia.git && \
cd sinopia && npm install --production && npm cache clean

ADD /config.yaml config.yaml

# non privledged user
USER daemon

EXPOSE 4873

CMD ["./bin/sinopia"]


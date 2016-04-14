# Pull base image.
<<<<<<< HEAD
<<<<<<< HEAD
FROM rnbwd/node-io:lts
=======
FROM rnbwd/node-io:0.10
>>>>>>> parent of fb28019... update node
=======
FROM rnbwd/node-io:0.10
>>>>>>> parent of fb28019... update node

MAINTAINER RnbWd <dwisner6@gmail.com>

# Sinopia Version / Path / Backup
RUN git clone --depth 1 https://github.com/RnbWd/sinopia.git &&  \
cd sinopia && \
npm install --production && \
npm cache clean

ADD /config.yaml /sinopa/config.yaml

WORKDIR /sinopia
VOLUME /sinopia/storage
# non privledged user
USER daemon
EXPOSE 4873

CMD ["./bin/sinopia"]




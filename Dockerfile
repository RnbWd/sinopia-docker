# Pull base image.
FROM node:slim

MAINTAINER RnbWd <dwisner6@gmail.com>

# Sinopia Version / Path / Backup

ENV version v1.0.0-beta 
ENV path /opt/sinopia 

# Install install / clone

RUN npm install -g yapm 
WORKDIR /opt
RUN git clone https://github.com/rlidwka/sinopia.git
WORKDIR $path
RUN git checkout $version
RUN yapm install . --production

# Clean

RUN rm -rf .git
RUN npm rm -g yapm
RUN npm cache clean

ADD config.yaml $path/config.yaml

CMD ["./bin/sinopia"]

EXPOSE 4873
VOLUME $path

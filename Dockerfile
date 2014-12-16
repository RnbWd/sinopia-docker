# Pull base image.
FROM node:slim

MAINTAINER RnbWd <dwisner6@gmail.com>

# Sinopia Version / Path / Backup

ENV VERSION v1.0.0-beta
ENV PATH /opt/sinopia
ENV BACKUP /opt/sinopia/backup

# Install install / clone

RUN npm install -g yapm 
WORKDIR /opt
RUN git clone https://github.com/rlidwka/sinopia.git
WORKDIR $PATH
RUN git checkout $VERSION
RUN yapm install --production

# Clean

RUN npm rm -g yapm
RUN npm cache clean
RUN rm -rf .git
ADD config.yaml $SINOPIA_PATH/config.yaml

CMD ["./bin/sinopia"]

EXPOSE 4873
VOLUME $PATH
VOLUME $BACKUP

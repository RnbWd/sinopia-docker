# Pull base image.
FROM node:slim

MAINTAINER RnbWd <dwisner6@gmail.com>

ENV path /opt/sinopia 
ENV backup /opt/sinopia/backup

# Install install / clone

RUN npm install -g yapm 
WORKDIR /opt
RUN git clone https://github.com/rnbwd/sinopia.git
WORKDIR $path
RUN yapm install . --production

# Clean

RUN rm -rf .git
RUN npm rm -g yapm
RUN npm cache clean

ADD config.yaml $path/config.yaml
# ADD backup.tar $path/backup/backup.tar

CMD ["./bin/sinopia"]

EXPOSE 4873
VOLUME $path
VOLUME $backup

# Pull base image.
FROM node:slim

MAINTAINER RnbWd <dwisner6@gmail.com>

ENV SINOPIA_VERSION 1.0.0-alpha.2
ENV SINOPIA_PATH /opt/sinopia

RUN npm install -g yapm 
WORKDIR /opt
RUN git clone https://github.com/RnbWd/sinopia
WORKDIR $SINOPIA_PATH
RUN rm -rf .git
RUN yapm install --production
RUN npm rm -g yapm
RUN npm cache clean
ADD config.yaml $SINOPIA_PATH/config.yaml
EXPOSE 4873
VOLUME $SINOPIA_PATH

CMD ["node", "bin/sinopia"]

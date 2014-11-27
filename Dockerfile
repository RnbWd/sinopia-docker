# Pull base image.
FROM ubuntu:14.10

MAINTAINER RnbWd <dwisner6@gmail.com>

RUN echo "deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu trusty main " > /etc/apt/sources.list.d/node-stable.list
RUN echo "deb-src http://ppa.launchpad.net/chris-lea/node.js/ubuntu trusty main " >> /etc/apt/sources.list.d/node-stable.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C7917B12

RUN apt-get update
RUN apt-get install -y build-essential 
RUN apt-get install -y python
RUN apt-get install -y nodejs
RUN rm -rf /var/lib/apt/lists/*

ENV SINOPIA_VERSION 1.0.0-alpha
ENV SINOPIA_PATH /opt/sinopia

RUN npm install -g sinopia@$SINOPIA_VERSION

RUN mkdir -p $SINOPIA_PATH/storage
ADD config.yaml $SINOPIA_PATH/config.yaml

VOLUME $SINOPIA_PATH

# RUN adduser --disabled-password --gecos 'Sinopia NPM mirror' sinopia
# RUN chown -R sinopia:sinopia $SINOPIA_PATH
# USER sinopia

WORKDIR $SINOPIA_PATH

CMD sinopia

EXPOSE 4873

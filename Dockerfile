# Pull base image.
FROM nodesource/node:trusty

MAINTAINER RnbWd <dwisner6@gmail.com>

ENV SINOPIA_VERSION v1.0.0-alpha
ENV SINOPIA_GIT https://github.com/rlidwka/sinopia.git
ENV SINOPIA_PATH /opt/sinopia

RUN npm install -g sinopia@1.0.0-alpha

RUN mkdir -p $SINOPIA_PATH/storage
ADD config.yaml $SINOPIA_PATH/config.yaml

VOLUME $SINOPIA_PATH

# RUN adduser --disabled-password --gecos 'Sinopia NPM mirror' sinopia
# RUN chown -R sinopia:sinopia $SINOPIA_PATH
# USER sinopia

WORKDIR $SINOPIA_PATH

CMD sinopia

EXPOSE 4873

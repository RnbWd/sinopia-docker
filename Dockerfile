FROM node:0.10

MAINTAINER David Wisner <dwisner6@gmail.com>

RUN adduser --disabled-password --gecos '' --shell /bin/bash --home /sinopia sinopia && \
  adduser sinopia sudo && \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER sinopia

RUN git clone --depth 1 https://github.com/rlidwka/sinopia  /sinopia/registry

ADD config.yaml /sinopia/registry/config.yaml

WORKDIR /sinopia/registry

RUN npm install --production && npm cache clean

# VOLUME /sinopia/storage
EXPOSE 4873
CMD ["./bin/sinopia"]




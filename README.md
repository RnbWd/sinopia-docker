## Sinopia (Docker Image)

[![Docker Stars](https://img.shields.io/docker/stars/rnbwd/sinopia.svg?style=flat-square)](https://hub.docker.com/r/rnbwd/sinopia/)
[![Docker Pulls](https://img.shields.io/docker/pulls/rnbwd/sinopia.svg?style=flat-square)](https://hub.docker.com/r/rnbwd/sinopia/)
[![Docker Size](https://img.shields.io/imagelayers/image-size/rnbwd/sinopia/latest.svg?style=flat-square)](https://hub.docker.com/r/rnbwd/sinopia/)
![License MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)

> [Sinopia](https://github.com/rlidwka/sinopia) is a private npm repository server.

This repo uses [rnbwd/sinopia](https://github.com/RnbWd/sinopia) for better compatability with docker and [nginx-proxy](https://github.com/jwilder/nginx-proxy).

### Recommend Usage

- To run default container on port 4873

`docker run --name sinopia -d -p 4873:4873 rnbwd/sinopia`

- to sync storage / config.yaml

`mkdir -p /path/to/storage`

`mkdir -p /path/to/config.yaml`

*edit [config.yaml](https://github.com/RnbWd/sinopia-docker/blob/master/config.yaml)*


`docker run --name sinopia -d -p 4873:4873 -v <local-path-to-storage>:/sinopia/storage -v <local-path-to-config>:/sinopia/config.yaml rnbwd/sinopia`

- The volume will be synced, so you can update the anything linked outside of the container and it will automatically change the files inside the container. Run `docker restart sinopia` if `config.yaml` is updated.

### Optional Usage

**Run nginx-proxy container:**

`docker run -d -p 80:80 -p 443:443 -v /path/to/certs:/etc/nginx/certs -v /var/run/docker.sock:/tmp/docker.sock:ro rnbwd/nginx`

`docker run -e VIRTUAL_HOST=site.com \
  -v /path/to/storage:/sinopia/storage \
  -v /path/to/config.yaml:/sinopia/config.yaml \
  --name sinopia -d -P rnbwd/sinopia`

### Building Custom Containers

- From github repository

```
git clone https://github.com/RnbWd/sinopia-docker.git
cd sinopia-docker
docker build -t sinopia .
docker run -d -p 4873:4873 sinopia
```


## Links

* [rnbwd/nginx](https://registry.hub.docker.com/u/rnbwd/nginx/)

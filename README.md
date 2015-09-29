## Sinopia (Docker Image)

[Sinopia](https://github.com/rlidwka/sinopia) is a private npm repository server.

This repo uses [rnbwd/sinopia](https://github.com/RnbWd/sinopia) for better compatability with docker and [nginx-proxy](https://github.com/RnbWd/nginx).

Using with node v4.1.1 - let me know if there's any issues with this version. The storage path is also changed in the [config.yaml](https://github.com/RnbWd/sinopia-docker/blob/master/config.yaml) to handle the edge case where htpasswd is installed via npm.

### Recommend Usage

**Generate ssl files on server:**

`mkdir -p /path/to/certs && cd /path/to/certs`

`openssl req -out site.com.csr -new -newkey rsa:2048 -nodes -keyout site.com.key`

`openssl dhparam -out site.com.dhparam.pem 2048`

**Run nginx-proxy container:**

`docker run -d -p 80:80 -p 443:443 -v /path/to/certs:/etc/nginx/certs -v /var/run/docker.sock:/tmp/docker.sock:ro rnbwd/nginx`

**Run sinopia container:**

`mkdir -p /path/to/storage`

`mkdir -p /path/to/config.yaml`

*edit [config.yaml](https://github.com/RnbWd/sinopia-docker/blob/master/config.yaml)*

docker run -e VIRTUAL_HOST=site.com \
  -v /path/to/storage:/sinopia/storage \
  -v /path/to/config.yaml:/sinopia/config.yaml \
  --name sinopia -d -P rnbwd/sinopia

### Optional Usage

- To run default container on port 4873

`docker run --name sinopia -d -p 4873:4873 rnbwd/sinopia`

- to sync storage

`docker run --name sinopia -d -p 4873:4873 -v <local-path-to-storage>:/sinopia/storage rnbwd/sinopia`

- To attach a custom [config.yaml](https://github.com/RnbWd/sinopia-docker/blob/master/config.yaml)

    docker run -v <local-path-to-config>:/sinopia/config.yaml \
    -d -p 4873:4873 rnbwd/sinopia`

- To modify config.yaml, update local config then restart

`docker restart sinopia`

### Building Custom Containers

- From github repository

```
git clone https://github.com/RnbWd/sinopia-docker.git
cd sinopia-docker
docker build -t sinopia .
docker run -d -p 4873:4873 sinopia
```

- Nginx support

Use [nginx-proxy](https://registry.hub.docker.com/u/rnbwd/nginx/) or [jwilder/nginx-proxy](https://registry.hub.docker.com/u/jwilder/nginx-proxy/)

After running the nginx-proxy, run the sinopia container with env var VIRTUAL_HOST

```
docker run -e VIRTUAL_HOST=foo.bar.com \
  -v <local-path-to-config>:/sinopia/config.yaml \
  --name sinopia -d -P rnbwd/sinopia
```

## Links

* [rnbwd/sinopia](https://github.com/RnbWd/sinopia)
* [nginx-proxy](https://registry.hub.docker.com/u/jwilder/nginx-proxy/)

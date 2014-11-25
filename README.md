## Sinopia (Docker Image)

[Sinopia](https://github.com/rlidwka/sinopia) is a private npm repository server. 

This docker image uses the [v1.0.0-alpha](https://github.com/rlidwka/sinopia/tree/v1.0.0-alpha) release

### Options

- To run default container on port 4873

`docker run --name sinopia -d -p 4873:4873 rnbwd/sinopia`

- To attach a custom [config.yaml](https://github.com/RnbWd/sinopia-docker/blob/master/config.yaml)

`docker run -v <local-path-to-config>:/opt/sinopia/config.yaml [...] rnbwd/sinopia`

- To modify config.yaml, update local config then restart

`docker restart sinopia`

- To modify config without attaching local volume

```
docker run --volumes-from sinopia -it --rm nodesource/node:trusty vi /opt/sinopia/config.yaml
docker restart sinopia
```

### Building Custom Containers

- From github repository

```
git clone https://github.com/RnbWd/sinopia-docker.git
cd sinopia-docker
docker build -t my/sinopia .
docker run -d -P my/sinopia
```

- SSL support 

Pull [nginx-ssl-proxy](https://registry.hub.docker.com/u/rnbwd/nginx-ssl-proxy/) 

`docker run -d -p 80:80 -p 443:443 -v <certs-dir>:/etc/nginx/certs -v /var/run/docker.sock:/tmp/docker.sock rnbwd/nginx-ssl-proxy`

Uncomment 'url_prefix' in [config.yaml](https://github.com/RnbWd/sinopia-docker/blob/master/config.yaml) and add your own host name

```
# if you use nginx with custom path, use this to override links
url_prefix: https://foo.bar.com
```

Then run sinopia container with env vars VIRTUAL_HOST and REDIRECT 

`docker run -e VIRTUAL_HOST=foo.bar.com -e REDIRECT=true -v <local-path-to-config>:/opt/sinopia/config.yaml -d -P rnbwd/sinopia`






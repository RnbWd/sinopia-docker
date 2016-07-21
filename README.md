## Sinopia (Docker Image)

> [Sinopia](https://github.com/rlidwka/sinopia) is a private npm repository server.

**Notice**
> Major update for stability  - currently using the orignal, [unmodified repo](https://github.com/rlidwka/sinopia) and [node v0.10](https://nodejs.org/docs/latest-v0.10.x/api/)

### Recommend Usage

- To run default container on port 4873

`docker run --name sinopia -d -p 4873:4873 rnbwd/sinopia`

- to sync storage / config.yaml

`mkdir -p /path/to/storage`

`mkdir -p /path/to/config.yaml`

*edit [config.yaml](https://github.com/RnbWd/sinopia-docker/blob/master/config.yaml)*


`docker run --name sinopia -d -p 4873:4873 -v <local-path-to-storage>:/sinopia/storage -v <local-path-to-config>:/sinopia/config.yaml rnbwd/sinopia`

- The volume will be synced, so you can update the anything linked outside of the container and it will automatically change the files inside the container. Run `docker restart sinopia` if `config.yaml` is updated.
wd/sinopia`

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

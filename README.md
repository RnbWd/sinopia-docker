## Sinopia (Docker Image)

[Sinopia](https://github.com/rlidwka/sinopia) is a private npm repository server. 

This docker image uses the [v1.0.0-alpha](https://github.com/rlidwka/sinopia/tree/v1.0.0-alpha) release

- Run Container

`docker run --name sinopia -d -p 4873:4873 rnbwd/sinopia`

- attach custom config.yaml

`docker run -v <local-path-to-config>:/opt/sinopia/config.yaml [...] rnbwd/sinopia`

- modify <local> config?

`docker restart sinopia`

- modify config without <local> attached?

`docker run --volumes-from sinopia -it --rm nodesource/node:trusty vi /opt/sinopia/config.yaml`
`docker restart sinopia`

- Build Custom Container

`git clone https://github.com/RnbWd/sinopia-docker.git`
`cd sinopia-docker`
`docker build -t my/sinopia .`
`docker run -d -P my/sinopia`

Modify [config.yaml](https://github.com/RnbWd/sinopia-docker/blob/master/config.yaml) for alternative default configurations or [Dockerfile](https://github.com/RnbWd/sinopia-docker/blob/master/Dockerfile) to change the image source or sinopia version.



  

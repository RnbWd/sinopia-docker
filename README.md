## Sinopia (Docker Image)

[Sinopia](https://github.com/rlidwka/sinopia) is a private npm repository server. 

This docker image uses the [v1.0.0-alpha](https://github.com/rlidwka/sinopia/tree/v1.0.0-alpha) release

### Default Container

    # run sinopia on port 4873
    docker run --name sinopia -d -p 4873:4873 rnbwd/sinopia

    # modify config.yaml
    docker stop sinopia
    docker run --volumes-from sinopia -it --rm nodesource/node:trusty vi /opt/sinopia/config.yaml
    docker start sinopia


### Creating Custom Container

    docker run --name sinopia -v \
      <local-path-to-config.yaml>:/opt/sinopia -d -p \
      4873:4873 rnbwd/sinopia

To modify the config.yaml, just change the local config.yaml linked above and restart sinopia.

`docker restart sinopia`

### Build from Repo

    git clone https://github.com/RnbWd/sinopia-docker.git
    docker build -t sinopia .
    docker run -d -P sinopia


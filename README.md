## Sinopia (Docker Image)

[Sinopia](https://github.com/rlidwka/sinopia) is a private npm repository server. 

### Creating Default Container

`docker run -d -P rnbwd/sinopia`

### Creating Custom Container


    docker run --name sinopia -v \
      <local-path-to-config.yaml>:/opt/sinopia -d -p \
      4873:4873 rnbwd/sinopia


To modify the configuration, just change the local config.yaml linked above and restart the container

`docker restart sinopia`

### Modify Config with Default Container 

    docker stop sinopia
    docker run --volumes-from sinopia -it --rm ubuntu vi /opt/sinopia/config.yaml
    docker start sinopia

### Build from Repo

    git clone https://github.com/RnbWd/docker-sinopia.git
    docker build -t sinopia .
    docker run -d -P sinopia


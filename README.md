## Sinopia (Docker Image)

[Sinopia](https://github.com/rlidwka/sinopia) is a private npm repository server. 

This docker image uses the [v1.0.0-alpha](https://github.com/rlidwka/sinopia/tree/v1.0.0-alpha) release

### Default Container

    # run sinopia on port 4873
    $ docker run --name sinopia -d -p 4873:4873 rnbwd/sinopia

    # attach custom config.yaml
    $ docker run -v <local-path-to-config>:/opt/sinopia/config.yaml [...] rnbwd/sinopia

    # modify and sync local config?
    $ docker restart sinopia

    # modify config but didn't attach custom?
    $ docker stop sinopia
    $ docker run --volumes-from sinopia -it --rm nodesource/node:trusty vi /opt/sinopia/config.yaml
    $ docker start sinopia

### Build Custom Container from Repo

    #clone repository
    git clone https://github.com/RnbWd/sinopia-docker.git

    # modify Dockerfile or config.yaml as you please :)
    docker build -t sinopia .

    # works same as above
    # just replace rnbwd/sinopia with your own image name
    docker run -d -P sinopia
    


  

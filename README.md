# Docker in Docker

Run Docker inside of a Docker container.

## Notes

The container must run with root privilege to work. To run it add the `--privileged` argument to the `docker run` command, like so:

``` bash
docker build -t local/docker:dev .
docker run --rm -it local/docker:dev docker run hello-world
```

In Kubernetes, set the security context to privileged:

``` bash
kind: Pod
apiVersion: v1
metadata:
  name: docker-in-docker
spec:
  containers:
  - name: docker-in-docker
    image: gmaresca/docker-in-docker:latest
    args:
    - docker
    - run
    - hello-world
    securityContext:
      privileged: true
```

[Docker Hub](https://hub.docker.com/r/gmaresca/docker-in-docker)

[docker.io package versions](https://launchpad.net/ubuntu/+source/docker.io)

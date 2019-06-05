FROM ubuntu:18.04

# Install Docker
RUN apt-get update \
 && apt-get install -y --install-recommends \
  docker.io=18.06.1-0ubuntu1.2~18.04.1 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /etc/apt/sources.list.d/*

COPY docker.service /lib/systemd/system/docker.service
COPY daemon.json /etc/docker/daemon.json

RUN mkdir -p /scratch/docker

# Add user to Docker group
RUN groupadd docker || true
RUN usermod -aG docker $(whoami)

COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

CMD ["docker"]

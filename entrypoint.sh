#!/bin/bash

service docker start

while [ ! -f /var/run/docker.pid ]
do
  sleep .5s
done

echo "Docker started"

exec "$@"

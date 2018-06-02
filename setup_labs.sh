#!/bin/bash

# change permissions on docker.sock to simplify setup
chmod 777 /run/docker.sock

# start the services
docker stack deploy -c docker-compose.yml ci

# grab the gradle version
wget https://services.gradle.org/distributions/gradle-3.4.1-bin.zip

# put the gradle version in place
sudo unzip -d /usr/share gradle-3.4.1-bin.zip



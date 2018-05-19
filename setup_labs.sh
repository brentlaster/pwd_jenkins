#!/bin/bash

# change permissions on docker.sock to simplify setup
chmod 777 /run/docker.sock

# pull down the necessary image
docker pull bclaster/dc_jenkins:1.5

# start the image running
docker service create -e JAVA_OPTS="-Dhudson.Main.development=true -Djenkins.install.runSetupWizard=false" -p 8080 --mount type=bind,source=/var/run/docker.sock,destination=/var/run/docker.sock  --name jenkins_lab bclaster/dc_jenkins:1.5

# grab the gradle version
wget https://services.gradle.org/distributions/gradle-3.4.1-bin.zip

# put the gradle version in place
sudo unzip -d /usr/share gradle-3.4.1-bin.zip

# copy the key out for ease of access
cp /root/pwd_jenkins/id_rsa.pub /root/id_rsa.pub

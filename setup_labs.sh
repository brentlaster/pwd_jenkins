#!/bin/bash

# pull down the necessary image
docker pull bclaster/dc_jenkins:1.5

# start the image running
docker run -p 8080:8080 --env JAVA_OPTS="-Dhudson.Main.development=true -Djenkins.install.runSetupWizard=false" bclaster/dc_jenkins:1.5 &

# grab the gradle version
wget https://services.gradle.org/distributions/gradle-3.4.1-bin.zip

# put the gradle version in place
sudo unzip -d /usr/share gradle-3.4.1-bin.zip

# determine the container name
cId=`docker ps | cut -d' ' -f1 | head -n 2 | grep -v CONTAINER`

# copy the key out for ease of access
docker cp $cId:/var/jenkins_home/.ssh/id_rsa.pub .

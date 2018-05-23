#!/bin/bash

# check if we are root or exit
USER_ID=$(id -u)

if [ "$USER_ID" -ne "0" ]; then
	echo "This script must be run as root, please run 'sudo $0'"
	exit 1
fi

# get the scripts directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#install oracle java 8
echo 'oracle-java8-installer shared/accepted-oracle-license-v1-1 select true' | debconf-set-selections
echo 'oracle-java8-installer shared/accepted-oracle-license-v1-1 seen true' | debconf-set-selections
apt-get update 
apt-get install software-properties-common screen -y
add-apt-repository ppa:webupd8team/java -y
apt-get update 
apt-get install oracle-java8-installer -y

# just for saftey: set java-alternatives to the newly installed oracle java. The build of java-tron will fail with openjdk variants
# ATTENTION: this might harm other software depending on openjdk!
update-java-alternatives -s /usr/lib/jvm/java-8-oracle

# build java-tron
# after checking it it becomes clear that ./gradlew build builds the java-tron.jar file that ./gradlew clean shadowJar builds anyways...
cd $DIR/java-tron
git checkout -t origin/master
./gradlew build 

exit 0

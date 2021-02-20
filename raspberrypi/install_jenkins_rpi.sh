#! /bin/bash

# Install JDK 11
sudo apt install default-jdk

# Add Jenkin's keys to our package keys
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

# Need to be 'root' user when running this command in order to write to a file in this directory
sudo echo "deb https://pkg.jenkins.io/debian binary/" > /etc/apt/sources.list.d/jenkins.list

sudo apt update
sudo apt install jenkins

# Start 'jenkins' and check health
sudo systemctl start jenkins
sudo systemctl status jenkins

# Enable 'jenkins' to start on boot of raspberry pi
sudo systemctl enable jenkins

# Fetch password for first-time login
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# Login: visit <IP_ADDRESS>:<JENKINS_DEFAULT_PORT>
# IP_ADDRESS is the Raspberry Pi's IP ('ifconfig')
# JENKINS_DEFAULT_PORT is set to 8080

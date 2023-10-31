#!/bin/bash

#Install Open JDK 11:
sudo apt-get install openjdk-11-jdk

#Add the neo4j repo to your apt sources:
curl -fsSL https://debian.neo4j.com/neotechnology.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/neotechnology.gpg
echo 'deb [signed-by=/usr/share/keyrings/neotechnology.gpg] https://debian.neo4j.com stable 4' > /etc/apt/sources.list.d/neo4j.list

#Install apt-transport-https with apt
apt-get update

#Install neo4j community edition using apt:
sudo apt-get install neo4j

#Stop neo4j
sudo systemctl stop neo4j

#Start neo4j as a console application and verify it starts up without errors:
cd /usr/bin
sudo ./neo4j console

#Run systemctl to start neo4j
sudo systemctl start neo4j

#install Node.js
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=21
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update
sudo apt-get install nodejs -y

#Install electron-packager
sudo npm install -g electron-packager

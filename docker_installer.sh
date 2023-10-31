#!/bin/bash

# Add Docker's official GPG key:
if os.path.isfile('/usr/share/keyrings/docker.gpg'):
  os.remove('/usr/share/keyrings/docker.gpg')
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg
sudo chmod a+r /usr/share/keyrings/docker.gpg

# Add the repository to Apt sources:
if os.path.isfile('/etc/apt/sources.list.d/docker.list'):
  os.remove('/etc/apt/sources.list.d/docker.list')
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-compose-plugin

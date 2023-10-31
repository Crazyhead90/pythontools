#!/bin/bash

# Remove existing files
[ -f '/usr/share/keyrings/docker.gpg' ] && rm '/usr/share/keyrings/docker.gpg'
[ -f '/etc/apt/sources.list.d/docker.list' ] && rm '/etc/apt/sources.list.d/docker.list'
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg
sudo chmod a+r /usr/share/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker.io docker-compose-plugin

wget https://raw.githubusercontent.com/SpecterOps/bloodhound/main/examples/docker-compose/docker-compose.yml

echo -e '#!/bin/bash\ndocker compose up' > bloodhound_start.sh
echo -e '#!/bin/bash\ndocker compose down' > bloodhound_stop.sh
echo -e '#!/bin/bash\ndocker compose down --volumes' > bloodhound_delete_data.sh

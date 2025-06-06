#!/bin/bash

# Remove existing files
[ -f '/usr/share/keyrings/docker.gpg' ] && sudo rm '/usr/share/keyrings/docker.gpg'
[ -f '/etc/apt/sources.list.d/docker.list' ] && sudo rm '/etc/apt/sources.list.d/docker.list'
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(curl https://download.docker.com/linux/debian/dists/ | awk '/href=/' | sed -n 2p | grep -o -P '(?<=>).*(?=<)' | sed 's/.$//') stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker.io docker-compose-plugin

wget https://raw.githubusercontent.com/SpecterOps/bloodhound/main/examples/docker-compose/docker-compose.yml

echo -e '#!/bin/bash\ndocker compose up' > bloodhound_start.sh
echo -e '#!/bin/bash\ndocker compose down' > bloodhound_stop.sh
echo -e '#!/bin/bash\ndocker compose down --volumes' > bloodhound_delete_data.sh

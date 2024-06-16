#!/bin/bash

tput setaf 2 && echo "Preparing to install..." && tput setaf 7

sudo apt-get remove -y docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
 $(lsb_release -cs) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

tput setaf 2 && echo "Installing Docker..." && tput setaf 7

sudo apt-get install -y docker-ce docker-ce-cli containerd.io

#sudo systemctl enable docker.service
#sudo systemctl enable containerd.service

tput setaf 2 && echo "Add user $USER to docker group..." && tput setaf 7

#sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

tput setaf 2 && echo "Finished." && tput setaf 7


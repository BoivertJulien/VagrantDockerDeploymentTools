#!/bin/bash
sudo apt update

### Docker Install
sudo apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

### Add default user to docker group
sudo gpasswd -a vagrant docker

### Docker Compose Install
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


### Prepare NGINX env
sudo docker pull nginx:stable

cd ~/Provision/nginx/nginx-shared/html/
rm -rf *
git clone https://github.com/BoivertJulien/WebPageTemplate .
cd ~/Provision/nginx


### Prepare WORDPRESS env
docker pull mysql:5.7
docker pull wordpress:latest
docker pull gitlab/gitlab-ce:latest

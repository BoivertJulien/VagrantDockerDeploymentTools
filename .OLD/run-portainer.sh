#!/bin/bash
cd ~/VM2_Provisioning
git clone https://github.com/portainer/portainer-compose
cd portainer-compose
docker-compose up -d
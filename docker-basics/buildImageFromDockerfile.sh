#!/bin/bash

docker build - < Dockerfile
# "docker image ls" should include new image builded with id
# "docker run <image_id>" to run the image builded
# "docker tag <image_id> <image_builded_name>" to assign name to image
# "docker run <image_builded_name>" to easily run the image builded
# "docker run <image_builded_name> --name <container_name>" to assign name to container

# A Dockerfile 	permit to build an image (docker build)
# An image 	permit to launch a container (docker run)
# A container	permit to provide a service

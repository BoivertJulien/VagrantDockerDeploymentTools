#!/bin/bash

docker run \
	--name nginx \
	--detach \
	--volume ~/Provision/nginx/nginx-shared/html:/usr/share/nginx/html \
	--volume ~/Provision/nginx/nginx-shared/conf.d:/etc/nginx/conf.d \
	--publish 80:80 \
	--hostname www \
	--restart always \
	nginx:stable
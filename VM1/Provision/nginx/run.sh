#!/bin/bash

### docker run --name my-nginx --mount source=~/my-nginx/html,target=/usr/share/nginx/html,readonly --mount source=~/my-nginx/conf,target=/etc/nginx/co$
docker run \
	--name nginx \
	--detach \
	--volume ~/Provision/nginx/nginx-shared/html:/usr/share/nginx/html \
	--volume ~/Provision/nginx/nginx-shared/conf.d:/etc/nginx/conf.d \
	--publish 80:80 \
	--hostname www \
	nginx:stable
	#--publish 8080:8080 \

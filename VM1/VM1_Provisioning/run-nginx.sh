#!/bin/bash

### docker run --name my-nginx --mount source=~/my-nginx/html,target=/usr/share/nginx/html,readonly --mount source=~/my-nginx/conf,target=/etc/nginx/co$
docker run \
	--name nginx \
	--detach \
	--volume ~/nginx-shared/html:/usr/share/nginx/html \
	--volume ~/nginx-shared/conf.d:/etc/nginx/conf.d \
	--publish 80:80 \
	--restart always \
	--hostname www.boivert.ovh \
	nginx:stable

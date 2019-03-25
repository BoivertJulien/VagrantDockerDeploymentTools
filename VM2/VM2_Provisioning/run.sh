#!/bin/bash

### docker run --name my-nginx --mount source=~/my-nginx/html,target=/usr/share/nginx/html,readonly --mount source=~/my-nginx/conf,target=/etc/nginx/co$
docker run --name nginx -d -v ~/html:/usr/share/nginx/html -v ~/conf.d:/etc/nginx/conf.d -p 80:80 nginx:stable

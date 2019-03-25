#!/bin/bash

docker run \
	--name gitlab \
	--detach \
	--env GITLAB_OMNIBUS_CONFIG="external_url 'http://192.168.2.23/'; gitlab_rails['lfs_enabled'] = true;"
	--volume ~/gitlab-shared/data:/var/opt/gitlab \
        --volume ~/gitlab-shared/logs:/var/log/gitlab \
	--volume ~/gitlab-shared/config:/etc/gitlab \
	--publish 2004:80 \
	--restart always \
	--hostname gitlab.boivert.ovh \
	gitlab/gitlab-ce:latest

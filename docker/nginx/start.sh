#!/bin/bash
#runs docker, mounts cert dir
# pull certs down before running

docker run -d \
--name ssl_test \
-v ~/sandbox/docker/nginx/certs/wildcard-fqtag-cert-5-1-2019:/etc/ssl/certs/ \
-v ~/sandbox/docker/nginx/config:/etc/nginx/conf.d/ \
-v ~/sandbox/docker/nginx/site/index.hrml:/var/www/site/index.html \
-p 443:443 \
nginx:latest

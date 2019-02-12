#!/bin/bash
#runs docker, mounts cert dir
# pull certs down before running

CERT_DIR=

docker run -d \
--name ssl_test \
-v ~/sandbox/docker/nginx/certs/${CERT_DIR}:/etc/ssl/certs/ \
-v ~/sandbox/docker/nginx/config:/etc/nginx/conf.d/ \
-v ~/sandbox/docker/nginx/site/index.html:/var/www/site/index.html \
-p 443:443 \
nginx:latest

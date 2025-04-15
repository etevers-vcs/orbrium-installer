#!/bin/bash

WORKING_PATH=$(realpath $0)
WORKING_DIR=$(dirname $WORKING_PATH)
source $WORKING_DIR/stage.profile

docker pull orbrium/common:base
docker pull orbrium/ldap:base
docker pull orbrium/postgresql:base
docker pull orbrium/elasticsearch:base
docker pull orbrium/redis:base
docker pull orbrium/keycloak:base
docker pull orbrium/minio:base
docker pull orbrium/guacamole:base
docker pull orbrium/guacd:base
docker pull orbrium/nginx:base
docker pull orbrium/install:$DEFAULT_STAGE

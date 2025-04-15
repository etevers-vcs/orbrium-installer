#!/bin/bash

WORKING_PATH=$(realpath $0)
WORKING_DIR=$(dirname $WORKING_PATH)
source $WORKING_DIR/stage.profile

touch $WORKING_DIR/ca.crt
chmod 600 $WORKING_DIR/ca.crt
touch $WORKING_DIR/ca.key
chmod 600 $WORKING_DIR/ca.key
touch $WORKING_DIR/server.crt
chmod 600 $WORKING_DIR/server.crt
touch $WORKING_DIR/server.key
chmod 600 $WORKING_DIR/server.key

docker run -ti --rm \
	-v $WORKING_DIR/ca.crt:/opt/orbrium/webcert/ca.crt:rw \
	-v $WORKING_DIR/ca.key:/opt/orbrium/webcert/ca.key:rw \
	-v $WORKING_DIR/server.crt:/opt/orbrium/webcert/server.crt:rw \
	-v $WORKING_DIR/server.key:/opt/orbrium/webcert/server.key:rw \
	orbrium/install:$DEFAULT_STAGE \
	python /opt/orbrium/webcert/generator.py

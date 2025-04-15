#!/bin/bash

WORKING_PATH=$(realpath $0)
WORKING_DIR=$(dirname $WORKING_PATH)
source $WORKING_DIR/stage.profile

echo "==================================================="
echo "# ENVIRONMENTS                                    #"
echo "==================================================="
while true; do
read -p "DOCKER_SOCK [default:/var/run/docker.sock]: " DOCKER_SOCK
if [ -n "$DOCKER_SOCK" ]; then
export DOCKER_SOCK=$DOCKER_SOCK
else
export DOCKER_SOCK="/var/run/docker.sock"
fi
if [ -e $DOCKER_SOCK ]; then
echo "  --> $DOCKER_SOCK [ OK ]"
break
else
echo "  --> $DOCKER_SOCK [ Failed ]"
fi
done
echo ""

docker run -ti --rm \
	-v $DOCKER_SOCK:/var/run/docker.sock \
	orbrium/install:$DEFAULT_STAGE-active \
	python pygma.py -d all
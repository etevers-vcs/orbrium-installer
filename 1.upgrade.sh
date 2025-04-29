#!/bin/bash

WORKING_PATH=$(realpath $0)
WORKING_DIR=$(dirname $WORKING_PATH)
source $WORKING_DIR/stage.profile

EPOCH_TIME=$(date +%s)
CONF_INI="$WORKING_DIR/$EPOCH_TIME.ini"

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
echo "==================================================="
echo ""

read -p "PRESS ENTER TO BUILD CONTAINERS"
echo $CONF_BIN | base64 -d | tee $CONF_INI.tmp >/dev/null
envsubst < $CONF_INI.tmp > $CONF_INI
rm -rf $CONF_INI.tmp
docker network create orbrium
docker rmi orbrium/install:$DEFAULT_STAGE-active
docker build -t orbrium/install:$DEFAULT_STAGE-active -f - / <<EOF
FROM orbrium/install:$DEFAULT_STAGE
ADD $CONF_INI /opt/orbrium/config.ini
ADD $WORKING_DIR/ca.crt /opt/orbrium/webcert/ca.crt
ADD $WORKING_DIR/ca.key /opt/orbrium/webcert/ca.key
ADD $WORKING_DIR/server.crt /opt/orbrium/webcert/server.crt
ADD $WORKING_DIR/server.key /opt/orbrium/webcert/server.key
EOF
rm -rf $CONF_INI
docker run -ti --rm \
	-v $DOCKER_SOCK:/var/run/docker.sock \
	orbrium/install:$DEFAULT_STAGE-active \
	python pygma.py -b all
echo ""

while true; do
read -p "SELECT TO DEPLOY CONTAINERS [yes or no]: " _YKEY
case $_YKEY in
	YES | Yes | Y | yes | y)
		docker run -ti --rm \
			-v $DOCKER_SOCK:/var/run/docker.sock \
			orbrium/install:$DEFAULT_STAGE-active \
			python pygma.py -d all
		echo ""
		echo "FINISHED"
		echo ""
		echo "LET'S GO ORBRIUM!!!"
		echo "  --> https://$DEFAULT_ENDPOINT"
		echo ""
		exit 0
		;;
	NO | No | N | no | n)
		echo ""
		echo "IF YOU WANT TO DEPLOY CONTAINERS... TO RUN \"4.deploy.sh\""
		echo ""
		exit 0
		;;
esac
done

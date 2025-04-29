#!/bin/bash

WORKING_PATH=$(realpath $0)
WORKING_DIR=$(dirname $WORKING_PATH)
source $WORKING_DIR/stage.profile

EPOCH_TIME=$(date +%s)
CONF_INI="$WORKING_DIR/$EPOCH_TIME.ini"

if [ ! -f $WORKING_DIR/ca.key ] || [ ! -f $WORKING_DIR/ca.crt ] || [ ! -f $WORKING_DIR/server.key ] || [ ! -f $WORKING_DIR/server.crt ]; then
echo "SSL CERT MUST BE REQUIRED SUCH AS"
echo "  --> $WORKING_DIR/ca.key"
echo "  --> $WORKING_DIR/ca.crt"
echo "  --> $WORKING_DIR/server.key"
echo "  --> $WORKING_DIR/server.crt"
echo ""
echo "YOU CAN GENERATE PRIVATE CERTS VIA \"2.gencert.sh\""
echo ""
exit 1
fi

source $WORKING_DIR/stage.bin

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
while true; do read -p "ENTER SYSTEM_ACCESS_KEY: " SYSTEM_ACCESS_KEY; if [ -n "$SYSTEM_ACCESS_KEY" ]; then export SYSTEM_ACCESS_KEY=$SYSTEM_ACCESS_KEY; break; fi; done
while true; do read -p "ENTER SYSTEM_SECRET_KEY: " SYSTEM_SECRET_KEY; if [ -n "$SYSTEM_SECRET_KEY" ]; then export SYSTEM_SECRET_KEY=$SYSTEM_SECRET_KEY; break; fi; done
echo "==================================================="
echo ""

echo "==================================================="
echo "# DEFAULT SETTINGS                                #"
echo "==================================================="
while true; do read -p "ENTER DEFAULT_DOMAIN: " DEFAULT_DOMAIN; if [ -n "$DEFAULT_DOMAIN" ]; then export DEFAULT_DOMAIN=$DEFAULT_DOMAIN; break; fi; done
while true; do read -p "ENTER DEFAULT_ENDPOINT: " DEFAULT_ENDPOINT; if [ -n "$DEFAULT_ENDPOINT" ]; then export DEFAULT_ENDPOINT=$DEFAULT_ENDPOINT; break; fi; done
while true; do read -p "ENTER DEFAULT_ADMIN_USERNAME: " DEFAULT_ADMIN_USERNAME; if [ -n "$DEFAULT_ADMIN_USERNAME" ]; then export DEFAULT_ADMIN_USERNAME=$DEFAULT_ADMIN_USERNAME; break; fi; done
while true; do read -p "ENTER DEFAULT_ADMIN_PASSWORD: " DEFAULT_ADMIN_PASSWORD; if [ -n "$DEFAULT_ADMIN_PASSWORD" ]; then export DEFAULT_ADMIN_PASSWORD=$DEFAULT_ADMIN_PASSWORD; break; fi; done
echo "==================================================="
echo ""

echo "==================================================="
echo "# CLOUD SETTINGS                                  #"
echo "==================================================="
while true; do read -p "ENTER CLOUD_DOMAIN: " CLOUD_DOMAIN; if [ -n "$CLOUD_DOMAIN" ]; then export CLOUD_DOMAIN=$CLOUD_DOMAIN; break; fi; done
while true; do read -p "ENTER ADMIN_PROJECT: " ADMIN_PROJECT; if [ -n "$ADMIN_PROJECT" ]; then export ADMIN_PROJECT=$ADMIN_PROJECT; break; fi; done
while true; do read -p "ENTER PRIME_PROJECT: " PRIME_PROJECT; if [ -n "$PRIME_PROJECT" ]; then export PRIME_PROJECT=$PRIME_PROJECT; break; fi; done
while true; do read -p "ENTER WSA_HOSTNAME: " WSA_HOSTNAME; if [ -n "$WSA_HOSTNAME" ]; then export WSA_HOSTNAME=$WSA_HOSTNAME; break; fi; done
while true; do read -p "ENTER WSA_DIRECTORY_DOMAIN: " WSA_DIRECTORY_DOMAIN; if [ -n "$WSA_DIRECTORY_DOMAIN" ]; then export WSA_DIRECTORY_DOMAIN=$WSA_DIRECTORY_DOMAIN; break; fi; done
while true; do read -p "ENTER WSA_CLIENT_ID: " WSA_CLIENT_ID; if [ -n "$WSA_CLIENT_ID" ]; then export WSA_CLIENT_ID=$WSA_CLIENT_ID; break; fi; done
while true; do read -p "ENTER WSA_CLIENT_SECRET: " WSA_CLIENT_SECRET; if [ -n "$WSA_CLIENT_SECRET" ]; then export WSA_CLIENT_SECRET=$WSA_CLIENT_SECRET; break; fi; done
while true; do read -p "ENTER WSA_ADMIN_USERNAME: " WSA_ADMIN_USERNAME; if [ -n "$WSA_ADMIN_USERNAME" ]; then export WSA_ADMIN_USERNAME=$WSA_ADMIN_USERNAME; break; fi; done
while true; do read -p "ENTER WSA_ADMIN_PASSWORD: " WSA_ADMIN_PASSWORD; if [ -n "$WSA_ADMIN_PASSWORD" ]; then export WSA_ADMIN_PASSWORD=$WSA_ADMIN_PASSWORD; break; fi; done
echo "==================================================="
echo ""

echo "==================================================="
echo "# SMTP SETTINGS                                   #"
echo "==================================================="
while true; do read -p "ENTER SMTP_HOSTNAME: " SMTP_HOSTNAME; if [ -n "$SMTP_HOSTNAME" ]; then export SMTP_HOSTNAME=$SMTP_HOSTNAME; break; fi; done
while true; do read -p "ENTER SMTP_HOSTPORT: " SMTP_HOSTPORT; if [ -n "$SMTP_HOSTPORT" ]; then export SMTP_HOSTPORT=$SMTP_HOSTPORT; break; fi; done
while true; do read -p "ENTER SMTP_USERNAME: " SMTP_USERNAME; if [ -n "$SMTP_USERNAME" ]; then export SMTP_USERNAME=$SMTP_USERNAME; break; fi; done
while true; do read -p "ENTER SMTP_PASSWORD: " SMTP_PASSWORD; if [ -n "$SMTP_PASSWORD" ]; then export SMTP_PASSWORD=$SMTP_PASSWORD; break; fi; done
while true; do read -p "ENTER SMTP_TLS [true or false]: " SMTP_TLS; if [ "$SMTP_TLS" == "true" ] || [ "$SMTP_TLS" == "false" ]; then export SMTP_TLS=$SMTP_TLS; break; fi; done
while true; do read -p "ENTER SMTP_SSL [true or false]: " SMTP_SSL; if [ "$SMTP_SSL" == "true" ] || [ "$SMTP_SSL" == "false" ]; then export SMTP_SSL=$SMTP_SSL; break; fi; done
echo "==================================================="
echo ""

echo "==================================================="
echo "# Confirming                                      #"
echo "==================================================="
echo "DOCKER_SOCK            = $DOCKER_SOCK"
echo "SYSTEM_ACCESS_KEY      = $SYSTEM_ACCESS_KEY"
echo "SYSTEM_SECRET_KEY      = $SYSTEM_SECRET_KEY"
echo "---------------------------------------------------"
echo "DEFAULT_DOMAIN         = $DEFAULT_DOMAIN"
echo "DEFAULT_ENDPOINT       = $DEFAULT_ENDPOINT"
echo "DEFAULT_ADMIN_USERNAME = $DEFAULT_ADMIN_USERNAME"
echo "DEFAULT_ADMIN_PASSWORD = $DEFAULT_ADMIN_PASSWORD"
echo "---------------------------------------------------"
echo "CLOUD_DOMAIN           = $CLOUD_DOMAIN"
echo "ADMIN_PROJECT          = $ADMIN_PROJECT"
echo "PRIME_PROJECT          = $PRIME_PROJECT"
echo "WSA_HOSTNAME           = $WSA_HOSTNAME"
echo "WSA_DIRECTORY_DOMAIN   = $WSA_DIRECTORY_DOMAIN"
echo "WSA_CLIENT_ID          = $WSA_CLIENT_ID"
echo "WSA_CLIENT_SECRET      = $WSA_CLIENT_SECRET"
echo "WSA_ADMIN_USERNAME     = $WSA_ADMIN_USERNAME"
echo "WSA_ADMIN_PASSWORD     = $WSA_ADMIN_PASSWORD"
echo "---------------------------------------------------"
echo "SMTP_HOSTNAME          = $SMTP_HOSTNAME"
echo "SMTP_HOSTPORT          = $SMTP_HOSTPORT"
echo "SMTP_USERNAME          = $SMTP_USERNAME"
echo "SMTP_PASSWORD          = $SMTP_PASSWORD"
echo "SMTP_TLS               = $SMTP_TLS"
echo "SMTP_SSL               = $SMTP_SSL"
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

#!/bin/bash
apt update
apt install -y curl jq

PROJECT=waterfall
MINECRAFT_VERSION=`curl -s https://papermc.io/api/v2/projects/${PROJECT} | jq -r '.versions' | jq -r '.[-1]'`
BUILD_NUMBER=`curl -s https://papermc.io/api/v2/projects/${PROJECT}/versions/${MINECRAFT_VERSION} | jq -r '.builds' | jq -r '.[-1]'`
	
JAR_NAME=${PROJECT}-${MINECRAFT_VERSION}-${BUILD_NUMBER}.jar

DOWNLOAD_URL=https://papermc.io/api/v2/projects/${PROJECT}/versions/${MINECRAFT_VERSION}/builds/${BUILD_NUMBER}/downloads/${JAR_NAME}

PLUGIN_DOWNLOAD_URL=https://gitlab.com/lax1dude/eaglercraftx-1.8/-/raw/main/gateway/EaglercraftXBungee/EaglerXBungee-Latest.jar

cd /server || exit

wget -O server.jar ${DOWNLOAD_URL}

mkdir plugins
cd plugins
wget ${PLUGIN_DOWNLOAD_URL}
cd ..

java -Xms${MIN_RAM} -Xmx${MAX_RAM} -jar server.jar
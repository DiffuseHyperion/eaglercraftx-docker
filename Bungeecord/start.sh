#!/bin/bash
DOWNLOAD_URL=https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
PLUGIN_DOWNLOAD_URL=https://gitlab.com/lax1dude/eaglercraftx-1.8/-/raw/main/gateway/EaglercraftXBungee/EaglerXBungee-Latest.jar

cd /server || exit

wget -O server.jar ${DOWNLOAD_URL}

mkdir plugins
cd plugins
wget ${PLUGIN_DOWNLOAD_URL}
cd ..

java -Xms${MIN_RAM} -Xmx${MAX_RAM} -jar server.jar
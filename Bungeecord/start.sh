#!/bin/sh
DOWNLOAD_URL=https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar

cd /server || exit

wget -O server.jar ${DOWNLOAD_URL}

java -Xms${MIN_RAM} -Xmx${MAX_RAM} -jar server.jar
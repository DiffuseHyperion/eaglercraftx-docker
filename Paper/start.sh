#!/bin/sh
DOWNLOAD_URL=https://api.papermc.io/v2/projects/paper/versions/1.8.8/builds/445/downloads/paper-1.8.8-445.jar

cd /server || exit

wget -O server.jar ${DOWNLOAD_URL}

# Setting online mode to false since bungeecord requires it
if [ ! -f /server/server.properties ]; then
echo "online-mode=false" > /server/server.properties
else
sed -i 's/online-mode=true/online-mode=false/g' /server/server.properties
fi

if [ "$EULA" = "true" ]; then
	echo "EULA has been set to true! Please read https://account.mojang.com/documents/minecraft_eula."
	if [ ! -f /server/eula.txt ]; then
		echo "No eula.txt found! This is normal for a fresh server."
		echo "eula=true" > /server/eula.txt
	fi
fi

java -Xms${MIN_RAM} -Xmx${MAX_RAM} -jar server.jar
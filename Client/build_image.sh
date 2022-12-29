FILE=client
if [ -d "$FILE" ]; then
	echo "Found client folder."
	if [ -f "$FILE/EaglercraftX_1.8_Offline_en_US.html" ]; then
		echo Removing en_US offline download.
		rm $FILE/EaglercraftX_1.8_Offline_en_US.html
	fi
	if [ -f "$FILE/EaglercraftX_1.8_Offline_International.html" ]; then
			echo Removing International offline download.
		rm $FILE/EaglercraftX_1.8_Offline_International.html
	fi
	if [ -z "$1" ]; then
		echo Building docker image with default name.
		docker build -t diffusehyperion/eaglercraftx-client .
	else
		echo Building docker image with the name $1.
		docker build -t $1 .
	fi
else
    echo Can\'t find client folder! Are you sure that it exists in the same folder as this script, and is named \"client\"?
fi

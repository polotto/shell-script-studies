#!/bin/bash

OLDIFS=$IFS
IFS=$'\n'
for user in $(cat /etc/passwd)
do
	USERNAME=$(echo "$user" | cut -d":" -f1)
	HOME_U=$(echo "$user" | cut -d":" -f6)
	if ls "$HOME_U" > /dev/null 2>&1
	then
		echo "Usuario: $USERNAME"
		echo "Arquivos JPG: $(find "$HOME_U" -name '*.jpg' | wc -l)"
		echo "Arquivos MP3: $(find "$HOME_U" -name '*.mp3' | wc -l)"
		echo "Arquivos MP4: $(find "$HOME_U" -name '*.mp4' | wc -l)"
		echo
	fi
done
IFS=$OLDIFS

#!/bin/bash

CONTAINERNAME=linux-docker # container name
LMAP=$(pwd) # local volume to be mapped
CVMAP=/src # path inside of container to be mapped

echo "Volume that will be mapped (local : container) -> $LMAP : $CVMAP"
echo "Choose a linux to run in a interactive mode:"
echo -e "1 - Ubuntu;\n2 - Debian;\n3 - Alpine;\ns - stop a container;\nq - quit"
read -p "Option: " OPT

clear
case $OPT in
	1)
		docker run \
  		--name $CONTAINERNAME \
  		-e HOST_IP=$(ifconfig en0 | awk '/ *inet /{print $2}') \
  		-v "$LMAP":"$CVMAP" \
  		-t -i \
  		ubuntu bash
		;;
	2)
		docker run \
 		--name $CONTAINERNAME \
		-e HOST_IP=$(ifconfig en0 | awk '/ *inet /{print $2}') \
  		-v "$LMAP":"$CVMAP" \
		-t -i \
		debian bash 
		;;
	3)
		docker run \
		--name $CONTAINERNAME \
		-e HOST_IP=$(ifconfig en0 | awk '/ *inet /{print $2}') \
  		-v "$LMAP":"$CVMAP" \
		-t -i \
		alpine sh
		;;
	s)
		docker container stop $CONTAINERNAME
		docker container rm $CONTAINERNAME
		;;
	q)
		echo "quiting..."
		exit
		;;
	*)
		echo "Invalid option"
		;;
esac

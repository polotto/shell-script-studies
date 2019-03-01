#!/bin/bash

CONTAINERNAME=linux-docker # container name
LMAP=$(pwd) # local volume to be mapped
CVMAP=/root # path inside of container to be mapped

echo "Volume that will be mapped (local : container) -> $LMAP : $CVMAP"
echo "Choose a linux to run in a interactive mode:"
echo -e "1 - Debian;\n2 - Ubuntu;\n3 - Alpine;\nc - connect to current running container;\ns - stop a container;\nq - quit"
read -p "Option: " OPT

clear
case $OPT in
	1)
		docker run \
 		--name $CONTAINERNAME \
		-e HOST_IP=$(ifconfig en0 | awk '/ *inet /{print $2}') \
		-e LANG=en_US.UTF-8 \
		-e LANGUAGE=en_US:en \
		-e LC_ALL=en_US.UTF-8 \
  		-v "$LMAP":"$CVMAP" \
		-d -t -i \
		debian 

		docker exec $CONTAINERNAME bash -c "apt-get update"
		docker exec $CONTAINERNAME bash -c "apt-get -y install man"
		docker exec $CONTAINERNAME bash -c "apt-get -y install less"
		docker exec $CONTAINERNAME bash -c "apt-get -y install procps"
		docker exec $CONTAINERNAME bash -c "apt-get -y install bc"
		docker exec $CONTAINERNAME bash -c "apt-get -y install vim"

		docker exec $CONTAINERNAME bash -c "apt-get -y install locales"
		docker exec $CONTAINERNAME bash -c "RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen"
				
		docker exec -it $CONTAINERNAME bash
		;;
	2)
		docker run \
  		--name $CONTAINERNAME \
		-e HOST_IP=$(ifconfig en0 | awk '/ *inet /{print $2}') \
  		-v "$LMAP":"$CVMAP" \
		-d -t -i \
  		ubuntu

		docker exec -it $CONTAINERNAME bash
		;;
	3)
		docker run \
		--name $CONTAINERNAME \
		-e HOST_IP=$(ifconfig en0 | awk '/ *inet /{print $2}') \
  		-v "$LMAP":"$CVMAP" \
		-t -i \
		alpine sh
		;;
	c)
		docker exec -it $CONTAINERNAME bash
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

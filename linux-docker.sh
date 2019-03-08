#!/bin/bash

CONTAINERNAME=linux-docker # container name
LMAP=$(pwd) # local volume to be mapped
CVMAP=/root # path inside of container to be mapped
LRSYSMAP=$LMAP/rsyslog.d
CVRSYSMAP=/etc/rsyslog.d

echo "-----------------------> Linux Container Creator <----------------------"
echo "Volumes that will be mapped (local : container):"
echo "Root user files --> $LMAP : $CVMAP"
echo "Rsyslog configurtion files --> $LRSYSMAP : $CVRSYSMAP"
echo
echo "Choose a linux to run in a interactive mode:"
echo -e "d - Debian, includes: locale en_US.UTF-8, man, less, ps, bc, vim, rsyslog, sendemail;\na - Alpine;\nc - connect to current running container;\ns - stop a container;\nq - quit"
read -p "Option: " OPT

case $OPT in
	d)
		docker run \
 		--name $CONTAINERNAME \
		-e HOST_IP=$(ifconfig en0 | awk '/ *inet /{print $2}') \
		-e LANG=en_US.UTF-8 \
		-e LANGUAGE=en_US:en \
		-e LC_ALL=en_US.UTF-8 \
  		-v "$LMAP":"$CVMAP" \
  		-v "$LRSYSMAP":"$CVRSYSMAP" \
		-d -t -i \
		debian 
		
		echo "-----------------> installing components <-----------------" 
		echo "-----------------> update..."
		docker exec $CONTAINERNAME bash -c "apt-get update" 

		echo "-----------------> locales and configuring ot en_US.UTF-8..."
		docker exec $CONTAINERNAME bash -c "apt-get -y install locales"
		docker exec $CONTAINERNAME bash -c "sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen"
		
		echo "-----------------> man..."
		docker exec $CONTAINERNAME bash -c "apt-get -y install man"

		echo "-----------------> less..."
		docker exec $CONTAINERNAME bash -c "apt-get -y install less"
		
		echo "-----------------> procps ps..."
		docker exec $CONTAINERNAME bash -c "apt-get -y install procps"
		
		echo "-----------------> bc..."
		docker exec $CONTAINERNAME bash -c "apt-get -y install bc"
		
		echo "-----------------> vim..."
		docker exec $CONTAINERNAME bash -c "apt-get -y install vim"

		echo "-----------------> rsyslog..."
		docker exec $CONTAINERNAME bash -c "apt-get -y install rsyslog"
		echo "-----------------> starting rsyslog"
		docker exec $CONTAINERNAME bash -c "service rsyslog start"
		
		echo "-----------------> sendemail..."
		docker exec $CONTAINERNAME bash -c "apt-get -y install sendemail"
		
		echo "-----------------> starting bash..."
		docker exec -it $CONTAINERNAME bash
		;;
	a)
		echo "-----------------> starting bash..."
		docker run \
		--name $CONTAINERNAME \
		-e HOST_IP=$(ifconfig en0 | awk '/ *inet /{print $2}') \
  		-v "$LMAP":"$CVMAP" \
		-t -i \
		alpine sh
		;;
	c)
		echo "-----------------> starting bash..."
		docker exec -it $CONTAINERNAME bash
		;;
	s)
		echo "-----------------> stopping container..."
		docker container stop $CONTAINERNAME
		echo "-----------------> removing container..."
		docker container rm $CONTAINERNAME
		;;
	q)
		echo "-----------------> quiting..."
		exit
		;;
	*)
		echo "-----------------> invalid option..."
		;;
esac

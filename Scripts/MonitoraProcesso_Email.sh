#!/bin/bash

EMAIL=root
TIME=5

if [ $# -ne 1 ]
then
	echo "insira um parametro para o script"
	echo "./MonitoraProcesso.sh <processo>"
	exit 1
fi

while true 
do
	if ps axu | grep "$1" | grep -v grep | grep -v $0 > /dev/null
	then
		sleep $TIME
	else
		echo "ATENCAO!!!!!! O processo $1 NAO esta em execucao!" | mail -s "$0" $EMAIL
		sleep $TIME
	fi
done

#!/bin/bash

if [ $# -ne 1 ]
then
	echo "insira um parametro para o script"
	exit 1
fi

until ps axu | grep "$1" | grep -v grep | grep -v $0 > /dev/null
do 
	echo "ATENCAO!!!!!! O processo $1 NAO esta em execucao!"
	sleep 2
done
echo "Processo em execucao: $(ps axu | grep "$1" | grep -v grep | grep -v $0 | head -1)"

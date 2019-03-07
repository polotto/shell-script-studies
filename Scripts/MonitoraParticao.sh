#!/bin/bash

EMAIL=root
USO_MAX=10

OLDIFS=$IFS
IFS=$"\n"

LOG_FILE=particao.out

for PART in $(df | grep sda)
do
	PART_NUM=$(echo $PART | tr -s " " | cut -d" " -f1)
	USO=$(echo $PART | tr -s " " | cut -d" " -f5 | tr -d "%")
	if [ $USO -gt $USO_MAX ]
	then
		LOG=$(echo "$(date) - A particao $PART_NUM ultrapassou o limite de $USO_MAX %, valor atual $USO" %)
		echo $LOG >> $LOG_FILE
		echo $LOG | mail -s "alerta para a particao $PART_NUM" $EMAIL
	fi
done

IFS=$OLDIFS

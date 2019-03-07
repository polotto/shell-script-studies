#!/bin/bash

EMAIL=root
LOG_LOCAL=local0.warn

POR_LOG=50
POR_LOG_EMAIL=80

while true
do
	TOTAL=$(free -m | grep Swap | tr -s " " | cut -d" " -f2)
	USED=$(free -m | grep Swap | tr -s " " | cut -d" " -f3)
	#TOTAL=100
	#USED=90
	POR=$(echo "($USED * 100) / ($TOTAL)" | bc)
	
	if [ $POR -gt $POR_LOG -a $POR -le $POR_LOG_EMAIL ]
	then
		logger -p $LOG_LOCAL "$(date) - atenção, o swap passou $POR_LOG, total: $USED"
	fi

	if [ $POR -gt $POR_LOG_EMAIL ]
	then
		LOG="$(date) - atenção, o swap passou $POR_LOG_EMAIL, total: $USED"
		logger -p $LOG_LOCAL $LOG
		echo $LOG | mail -s "alerta swap" $EMAIL 
	fi

	sleep 5
done

#!/bin/bash

UID_MIN=$(cat /etc/login.defs | egrep "^UID_MIN" | cut -d" " -f2)
UID_MAX=$(cat /etc/login.defs | egrep "^UID_MAX" | cut -d$'\t' -f4)

echo -e "Usuario\tUID\tDIR HOME\tNOME OU DESCRICAO"

OLDIFS=$IFS
IFS=$'\n'

for user in $(cat /etc/passwd)
do
	UID_U=$(echo "$user" | cut -d":" -f3)

	if [ $UID_U -ge $UID_MIN -a $UID_U -le $UID_MAX ]
	then
		USERNAME=$(echo "$user" | cut -d":" -f1)
		HOME_U=$(echo "$user" | cut -d":" -f6)
		DESC=$(echo "$user" | cut -d":" -f5)
		
		echo -e "$USERNAME\t$UID_U\t$HOME_U\t\t$DESC"
	fi
done

IFS=$OLDIFS

#!/bin/bash
USUARIO=$(grep "$1" /etc/passwd)

# if grep "$1" /etc/passwd > /dev/null
# if test -n "$USUARIO"
if [ -n "$USUARIO" ]
then
	echo "O usuário existe"
	US=$(echo "$USUARIO" | cut -d":" -f1)
	if [ "$US" = "root" ]
	then
		echo ok
	fi
else
	echo "O usuário não exite"	
fi

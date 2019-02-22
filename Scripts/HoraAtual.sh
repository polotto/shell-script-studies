#!/bin/bash

HORA=$(date +%H)
if [ $HORA -ge 6 -a $HORA -lt 12  ]
then
	echo "Bom dia!"
elif [ $HORA -ge 12 -a $HORA -lt 18 ]
then
	echo "Boa tarde!"
elif [ $HORA -ge 18 -a $HORA -lt 23 -o $HORA -ge 0 -a $HORA -lt 6 ]
then
	echo "Boa noite!"
fi

echo "A hora atual é: $(date +"%I:%m %p")"

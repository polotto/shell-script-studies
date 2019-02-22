#!/bin/bash

clear
read -p "Informe o limite de processos: " MAXIMO

while [ $(ps axu|wc -l) -le $MAXIMO ]
do
	echo "tudo ok"
	echo "processos atuais: $(ps axu | wc -l)"
	sleep 3
	echo
done

echo "Limite de processos excedido"
echo "por favor verifique o sistema"

#!/bin/bash

clear
read -p "Informe o Limite de Processos: " MAXIMO

while [ $(ps axu|wc -l) -le $MAXIMO ]
do
	echo "Tudo OK"
	echo "Processos Atuais: $(ps axu|wc -l)"
	sleep 3
	echo
done

echo "Limite de Processos Excedido"
echo "Por favor verifique o sistema"

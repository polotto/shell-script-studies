#!/bin/bash

clear
read -p "Informe o in√cio da sequ√ncia: " INICIO
read -p "Informe o final da sequ√ncia: " FINAL

for i in $(seq "$INICIO" "$FINAL")
do
	echo "exibindo o valor $i"
	sleep 1
done


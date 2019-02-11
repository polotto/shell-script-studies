#!/bin/bash

clear
read -p "Informe o início da sequência: " INICIO
read -p "Informe o final da sequência: " FINAL

for i in $(seq "$INICIO" "$FINAL")
do
	echo "Exibindo o valor $i"
	sleep 1
done


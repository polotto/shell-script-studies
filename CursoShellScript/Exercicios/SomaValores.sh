#!/bin/bash

#########################################################################
# Exercício 1 - Criando e Executando Scripts				#
#									#
# Nome: SomaValores.sh							#
#									#
# Autor: Ricardo Prudenciato (ricardo@linuxsemfronteiras.com.br)	#
# Data: DD/MM/AAAA							#
#									#
# Descrição: O script faz a soma de dois valores inseridos 		#
#	     pelo usuário						#
#									#
# Uso: ./SomaValores.sh							#
#									#
#########################################################################

read -p "Informe o Valor 1: " VALOR1
read -p "Informe o Valor 2: " VALOR2

echo 
echo "A soma de $VALOR1 + $VALOR2 é $(expr $VALOR1 + $VALOR2)"

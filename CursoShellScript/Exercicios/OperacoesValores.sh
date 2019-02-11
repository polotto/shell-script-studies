#!/bin/bash

#########################################################################
# Exercício 3 - Instruções Condicionais                                 #
#									#
# Nome: OperacoesValores.sh						#
#									#
# Autor: Ricardo Prudenciato (ricardo@linuxsemfronteiras.com.br)	#
# Data: DD/MM/AAAA							#
#									#
# Descrição: O script recebe dois valores inseridos pelo usuário	#				
#	     e exibe um menu para que uma das operações básicas 	#
#	     seja realizada						#
#									#
# Uso: ./OperacoesValores.sh						#
#									#
#########################################################################

read -p "Informe o Valor 1: " VALOR1
read -p "Informe o Valor 2: " VALOR2

if [ ! $VALOR1 ] || [ ! $VALOR2 ]       # Também poderia ser usado o -z
then
	echo "Nenhum dos valores pode ser nulo"
	exit 1
fi

echo
echo "Escolha uma Operação:"
echo "1 = Soma"
echo "2 = Subtração"
echo "3 = Multiplicação"
echo "4 = Divisão"
echo "Q = Sair"
echo
read -p "Opção: " OPCAO 
echo

case $OPCAO in 
	1)
		OPER="+"
		;;
        2)	
		OPER="-"
		;;
        3)
		if [ $VALOR1 -eq 0 -o $VALOR2 -eq 0 ] 
		then
			echo "Um valor 0 não pode ser utilizado em um multiplicação"
			exit 1
		fi
		OPER="*"
		;;
        4)
		if [ $VALOR1 -eq 0 -o $VALOR2 -eq 0 ] 
		then
			echo "Um valor 0 não pode ser utilizado em uma divisão"
			exit 1
		fi
		
		if [ $(expr $VALOR1 % $VALOR2) -ne 0 ]
		then
			echo "Divisão com Resto = $(expr $VALOR1 % $VALOR2)"
		else
			echo "Divisão Exata"
		fi
		echo
		OPER="/"
		;;
	[Qq])
		echo "Saindo..."
		exit
		;;
	*)
		echo "Opção Inválida!"
		exit 1
		;;
esac		
echo "$VALOR1 $OPER $VALOR2 = $(expr $VALOR1 "$OPER" $VALOR2)"

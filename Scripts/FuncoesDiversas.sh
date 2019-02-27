#!/bin/bash

function help () {
	echo "Uso ./FuncoesDiversas.sh OPCAO DATA"
	echo
	echo "DATA nos formatos DDMMYYYY ou MMDDYYYY, com ou sem /"
	echo
	echo "Opcoes: "
	echo "-f = Retorna 0 para BR, 1 para US e 2 quando impossivel determinar, 3 invalido"
	echo "-i = Inverter formato BR para US e US para BR. Inclui as Barras"
	echo "-b = Inclui Barras de Data. Exemplo: de 13081981 para 13/08/1981"
	echo "-e = Exibe a data em formato extenso. Exemplo de 13081918 para 13 de Agosto de 1981"
}

function validaBRUS () {
	local DD=$1
	local MM=$2
	local YY=$3

	# o date aceita somenta data no formato MM/DD/YYYY
	# qualquer coisa diferente disso, produz um erro

	# verifica se esta no formato BR
	# ou seja, inverte o MM e o DD
	date -d "$MM/$DD/$YY" > /dev/null 2>&1
	local BR=$?

	# verifica se esta no formato US
	# nada é alterado
	date -d "$DD/$MM/$YY" > /dev/null 2>&1
	local US=$?

	if [ $US -eq 0 -a $BR -eq 0 ]
	then
		return 2
	elif [ $BR -eq 0 ]
	then 
		return 0
	elif [ $US -eq 0 ]
	then
		return 1
	else
		return 3
	fi
}

function inverte () {
	local DD=$1
	local MM=$2
	local YY=$3

	# verifica se esta no formato BR
	date "+%d/%m/%Y" -d "$MM/$DD/$YY" > /tmp/databr  2> /dev/null
	local BR=$?
	# verifica se esta no formato US
	date "+%m/%d/%Y" -d "$DD/$MM/$YY" > /tmp/dataus 2> /dev/null
	local US=$?

	if [ $BR -eq 0 ]
	then
		cat /tmp/databr
	elif [ $US -eq 0 ]
	then
		cat /tmp/dataus
	else
		echo "Data invalida"
	fi
}

function barras () {
	local DD=$1
	local MM=$2
	local YY=$3

	echo "$DD/$MM/$YY"
}

function exibe () {
	local DD=$1
	local MM=$2
	local YY=$3

	date "+%d de %B de %Y"  -d "$DD/$MM/$YY"	
}

function main () {
	local OPT=$1
	local DATE=$(echo $2 | tr -d '/')
	
	local DD=$(echo $DATE | cut -c1-2)
	local MM=$(echo $DATE | cut -c3-4)
	local YY=$(echo $DATE | cut -c5-8)

	case $OPT in
	--help)
		help
	 	;;
	-f)
		validaBRUS $DD $MM $YY
		echo $?
		;;
	-i)
		inverte $DD $MM $YY
		;;
	-b)
		barras $DD $MM $YY
		;;
	-e)
		exibe $DD $MM $YY
		;;
	*)
		echo "opcao invalida"
		;;
	esac
}

if [ $# -eq 0 ]
then
	echo "inisira um ou dois paramatros para utilizar"
	echo "exemplo: FuncoesDiversas.sh <OPT> <DATA>"
	echo "exemplo: FuncoesDiversas.sh --help"
	exit 4
fi

main $1 $2

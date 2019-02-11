#!/bin/bash

#########################################################################
# Exercício 1 - Instruções Condicionais                                 #
#									#
# Nome: HoraAtual.sh							#
#									#
# Autor: Ricardo Prudenciato (ricardo@linuxsemfronteiras.com.br)	#
# Data: DD/MM/AAAA							#
#									#
# Descrição: Exibe a hora atual no formato de 0 a 12, 			#
#	     indicando am/pm e dando uma mensagem de bom dia,		#
#	     boa tarde ou boa noite					#
#									#
# Uso: ./HoraAtual.sh							#
#									#
#########################################################################

#HORA=$1
HORA=$(date +%H)
MIN=$(date +%M)

# Case para definir período
# Estou considerando que das 00:00 às 06:00 é noite
echo
case $HORA in
	0[6-9] | 1[01])
		echo "Bom Dia!"
		;;
	1[2-7])
		echo "Boa Tarde!"
		;;
	*)
		echo "Boa Noite!"
		;;
esac
	
# If para reduzir a hora e definir AMPM
if [ $HORA -ge 12 ] 
then
	AMPM=PM
	if [ $HORA -ne 12 ]
	then	
		HORA=$(expr $HORA - 12)
	fi
else
	AMPM=AM
fi

echo
echo "A hora atual é: $HORA:$MIN $AMPM"

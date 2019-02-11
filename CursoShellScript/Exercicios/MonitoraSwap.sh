#!/bin/bash

#########################################################################
# Exercício 3 - Gerando Logs e Enviando E-mails                         #
#									#	
# Nome: MonitoraSwap.sh							#
#									#
# Autor: Ricardo Prudenciato (ricardo@linuxsemfronteiras.com.br)	#
# Data: DD/MM/AAAA							#
#									#
# Descrição: Ao ser executado o processo verifica a utilizacao 	 	#
# da área de swap. Cria um log a partir de 50% e envia um alarme	#
# a partir de 80%							#
#									#
# Uso: ./MonitoraSwap.sh						#
#									#
#########################################################################

EMAIL=ricardo@linuxsemfronteiras.com.br
LIMITE_LOG=50
LIMITE_EMAIL=80
ARQ_TEMP=/tmp/monitora-swap.tmp

USO=$(free -m|grep Swap|tr -s " " |cut -d " " -f3)
TOTAL=$(free -m|grep Swap|tr -s " " |cut -d " " -f2)
#PERC=$(expr $USO / $TOTAL \* 100)
PERC=92

if [ $PERC -ge $LIMITE_LOG ] 
then
	logger -p local7.warn -t [MonitoraSwap] "Uso de Swap = $PERC%"
	if [ $PERC -ge $LIMITE_EMAIL ] 
	then
		echo -e "Atencao. O uso de Swap esta acima do limite.\n" >> $ARQ_TEMP
		echo "Limite = $LIMITE_EMAIL%" >> $ARQ_TEMP
		echo -e "Valor Atual = $PERC%\n" >> $ARQ_TEMP
		free -m >> $ARQ_TEMP
		mail -s "[basename $0] Uso de Swap Acima de $LIMITE_EMAIL%" $EMAIL < $ARQ_TEMP
	fi
fi

rm -f $ARQ_TEMP


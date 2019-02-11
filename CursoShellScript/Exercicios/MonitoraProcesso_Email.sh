#!/bin/bash

#########################################################################
# Exercício 1 - Gerando Logs e Enviando E-mails				#
#									#	
# Nome: MonitoraProcesso_Email.sh					#
#									#
# Autor: Ricardo Prudenciato (ricardo@linuxsemfronteiras.com.br)	#
# Data: DD/MM/AAAA							#
#									#
# Descrição: Processo deve rodar como Daemon, monitorando a execução 	#
# de um processo passado por parâmetro.	Envia um e-mail 	 	#
# quando o processo não está em execução				#
#									#
# Uso: ./MonitoraProcesso.sh_Email.sh <processo>			#
#									#
#########################################################################

TIME=10

EMAIL=ricardo@linuxsemfronteiras.com.br

if [ $# -eq 0 ]
then
	echo "Favor informar um processo como argumento."
	echo "$0 <processo>"
	exit 1
fi

while true
do
	if ps axu |grep $1 |grep -v grep |grep -v $0 > /dev/null
	then
		sleep $TIME
	else
		echo "ATENCAO!!!!!!! O processo $1 NAO esta em execucao!" | mail -s "[$0] Monitoracao do Processo $1" $EMAIL
		sleep $TIME
	fi
done

#!/bin/bash

#########################################################################
# Exercício 2 - Gerando Logs e Enviando E-mails                         #
#									#	
# Nome: MonitoraFS.sh							#
#									#
# Autor: Ricardo Prudenciato (ricardo@linuxsemfronteiras.com.br)	#
# Data: DD/MM/AAAA							#
#									#
# Descrição: Ao ser executado o processo verifica as partições	 	#
# e caso a % de utilização de alguma delas esteja acima do limite	#
# um e-mail é enviado							#
#									#
# Uso: ./MonitoraFS.sh							#
#									#
#########################################################################

EMAIL=ricardo@linuxsemfronteiras.com.br
LIMITE=10
ARQ_TEMP=/tmp/monitora-particao.tmp
LOG=/var/log/scripts/$(basename $0).log

for loop in $(df -h |grep sda|tr -s " " |tr -s ' ' ':')
do
	USO=$(echo $loop|cut -d":" -f5|tr -d "%")
	if [ $USO -ge $LIMITE ]
	then
		PARTICAO=$(echo $loop|cut -d":" -f6)

		# Gera e Envia E-mail
		echo "Atencao! A Particao $PARTICAO esta com uso acima do limite configurado" >> $ARQ_TEMP
		echo >> $ARQ_TEMP
		echo "Limite = $LIMITE%" >> $ARQ_TEMP
		echo >> $ARQ_TEMP
		df -h $PARTICAO >> $ARQ_TEMP

		mail -s "[$0] - Verificar Particao $PARTICAO" $EMAIL < $ARQ_TEMP
		
		# Gera LOG		
		echo "$(date "+%d/%m/%Y %H:%M") - Particao $PARTICAO - Uso $USO%" >> $LOG
		rm -f $ARQ_TEMP
	fi
done


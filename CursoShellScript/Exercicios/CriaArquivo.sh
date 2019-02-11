#!/bin/bash

#########################################################################
# Exercício 4 - Instruções de Loop                                      #
#									#	
# Nome: CriaArquivo.sh							#
#									#
# Autor: Ricardo Prudenciato (ricardo@linuxsemfronteiras.com.br)	#
# Data: DD/MM/AAAA							#
#									#
# Descrição: Baseado em informações do usuário, o script criar um 	#
# arquivo texto de determinado tamanho				 	#
#									#
# Uso: ./CriaArquivo.sh 						#
#									#
#########################################################################

read -p "Informe o nome do arquivo a ser criado: " FILE
read -p "Informe um conjunto de caracteres: " WORD
read -p "Informe o tamanho final do arquivo (em bytes): " SIZE

cat /dev/null > $FILE

PORC_EXIBIDA=0

until [ $SIZE -le $(stat --printf=%s "$FILE") ] 
do
	echo -n $WORD >> $FILE
	SIZEATUAL=$(stat --printf=%s "$FILE")

	PORC_ATUAL=$(expr $SIZEATUAL \* 100 / $SIZE)
	
	if [ $(expr $PORC_ATUAL % 10) -eq 0 -a $PORC_EXIBIDA -ne $PORC_ATUAL ]
	then
		echo "Concluído: $PORC_ATUAL% - Tamanho do Arquivo: $SIZEATUAL"
		PORC_EXIBIDA=$PORC_ATUAL
	fi
done

#!/bin/bash

#########################################################################
# Exercício 3 - Criando e Executando Scripts                            #
#									#
# Nome: RelatorioUsuario.sh						#
#									#
# Autor: Ricardo Prudenciato (ricardo@linuxsemfronteiras.com.br)	#
# Data: DD/MM/AAAA							#
#									#
# Descrição: O script gera um relatório com informações de um		#
#	     usuário do sistema passado como parâmetro			#
#									#
# Uso: ./RelatorioUsuario.sh <usuario>					#
#									#
#########################################################################

#ls /home/$1 > /dev/null 2>&1 || echo "Usuario Inexistente"
#ls /home/$1 > /dev/null 2>&1 || exit 1

ls /home/$1 > /dev/null 2>&1 || { echo "Usuario Inexistente" ; exit 1; }

USERID=$(grep $1 /etc/passwd|cut -d":" -f3)
DESC=$(grep $1 /etc/passwd|cut -d":" -f5 | tr -d ,)
USOHOME=$(du -sh /home/$1|cut -f1)

clear
echo "=========================================================================="
echo "Relatório do Usuário: $1"
echo 
echo "UID: $USERID"
echo "Nome ou Descrição: $DESC"
echo 
echo "Total Usado no /home/$1: $USOHOME"
echo
echo "Ultimo Login:"
lastlog -u $1
echo "=========================================================================="
exit 0

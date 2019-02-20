#!/bin/bash

###########################################################
#
# Nome: RelatorioUsuario.sh
#
# Autor: Polotto (@email)
# Data: DD/MM/AAAA
#
# Descrição: Retorna informações de um usuário do sistema
#
# Uso: ./RelatorioUsuario.sh <usuario>
#
###########################################################

clear

USER=$1

# validar se o usuário existe
# ls /home/$1 > /dev/null 2>&1 || { echo "Usuário inexistente" ; exit 1; }

USERID=$(cat /etc/passwd | grep "$USER" | cut -d":" -f3 || exit 1)
USERDESC=$(cat /etc/passwd | grep "$USER" | cut -d":" -f5)
USERHOME=$(cat /etc/passwd | grep "$USER" | cut -d":" -f6)

echo "==============================================================="
# uid do usuário
echo "UID $USERID"

# nome completo e descrição
echo "Nome ou descrição: $USERDESC"
echo

# total em uso no /home do usuário
echo "Total usado no $USERHOME: $(du -sh "$USERHOME")"
echo

# ultimo login
echo "Ultimo Login:"
echo "$(lastlog -u "$USER")"
echo "================================================================"

#!/bin/bash 

ADMIN=root
FILE=/tmp/msg_temp

#CONTEUDO="$(date): Iniciando o script\n"
echo "$(date): Inciiado o script" | tee -a $FILE # >> $FILE

sleep 5

#CONTEUDO="$CONTEUDO$(date): Fim do script\n"
echo "$(date): Script finalizado" | tee -a $FILE # >> $FILE

#echo -e "$CONTEUDO" | mail -s "Relatorio do script $0" $ADMIN
mail -s "Relatorio de execucao do $0" $ADMIN < $FILE

rm -f $FILE

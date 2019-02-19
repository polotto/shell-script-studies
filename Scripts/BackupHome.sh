#!/bin/bash

#############
# Autor: Polotto
#
# Exemplo de uso: ./BackupHome.sh
#############

BACKUPDIR="$HOME/Backup"

# caso não exista, cria o diretório de backup
if ! ls "$BACKUPDIR"
then
	echo "diretório para backup não encontrado"
	echo "criando o diretório: $BACKUPDIR"
	mkdir "$BACKUPDIR"
else
	# lista o diretório e ordena do mais novo para o mais velho
	DIRLIST=$(ls -A -c "$BACKUPDIR")

	# verifica se exite algo no diretório
	if [ ! -z "$DIRLIST"  ]
	then
		FILE=$(echo "$DIRLIST" | head -1 | cut -d"_" -f3 | cut -d"." -f1)
		echo $FILE
		DATE=$(date --date="$FILE")
		echo $DATE
	fi
fi

# comprime os arquivos
DATENOW=$(date '+%Y%m%d%H%M')
NOMEBACKUP=$(echo "backup_home_$DATENOW.tgz")

echo "Criando backup..."
tar -cvzf "$BACKUPDIR/$NOMEBACKUP" $HOME
echo "O backup $NOMEBACKUP foi criado em $BACKUPDIR"
echo "Backup concluído!"

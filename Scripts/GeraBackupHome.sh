#!/bin/bash

#############
# Autor: Polotto
#
# Exemplo de uso: ./BackupHome.sh
#############

BACKUPDIR="$HOME/Backup"

create_backup()
{
	# comprime os arquivos
	DATENOW=$(date '+%Y%m%d%H%M')
	NOMEBACKUP=$(echo "backup_home_$DATENOW.tgz")

	echo "-> Criando backup..."
	tar -cvzf "$BACKUPDIR/$NOMEBACKUP" $HOME
	echo "-> O backup $NOMEBACKUP foi criado em $BACKUPDIR"
	echo "Backup concluído!"
}

# caso não exista, cria o diretório de backup
#if ! ls "$BACKUPDIR" > /dev/null 2>&1
if [ ! -d $BACKUPDIR  ]
then
	echo "Diretório para backup não encontrado"
	echo "-> Criando o diretório: $BACKUPDIR"
	mkdir "$BACKUPDIR" > /dev/null
	create_backup
else
	# lista o diretório e ordena do mais novo para o mais velho
	DIRLIST=$(ls -A -c "$BACKUPDIR")

	# verifica se exite algo no diretório
	if [ ! -z "$DIRLIST"  ]
	then
		FILED=$(echo "$DIRLIST" | head -1 | cut -d"_" -f3 | cut -d"." -f1)
		DATEFILE=${FILED:0:6}
		DATENOW=$(date +"%Y%m")
		NUMBERWEEKFILE=$(date +%U -d "${FILED:0:8} ${FILED:8:2}:${FILED:10:2}")
		NUMBERWEEKNOW=$(date +%U)
		if [ $DATENOW -eq $DATEFILE -a $NUMBERWEEKNOW -eq $NUMBERWEEKFILE ]
		then
			echo "Já foi gerado um backup no diretório $BACKUPDIR nos últimos 7 dias."
			read -p "-> Deseja continuar? (N/s): " OPT
			if [ $OPT = 's'  ]
			then
				create_backup
				echo "Backup criado para a mesma semana"
			else
				echo "-> Saindo: exit code 1"
				exit 1
			fi		
		else
			create_backup
		fi
	fi
fi


#!/bin/bash

#########################################################################
# Exercício 3 - Instruções de Loop                                      #
#									#	
# Nome: InspecionaHome.sh						#
#									#
# Autor: Ricardo Prudenciato (ricardo@linuxsemfronteiras.com.br)	#
# Data: DD/MM/AAAA							#
#									#
# Descrição: Inspeciona os diretórios home dos usuários em busca 	#
# de arquivos de determinadas extensões				 	#
#									#
# Uso: ./InspecionaHome.sh 						#
#									#
#########################################################################

#Serão procurados arquivos do tipo .mp4, .mp3 e .jpg

for user in /home/*
do
	MP4COUNT=0
	MP3COUNT=0
	JPGCOUNT=0
	OLDIFS=$IFS
	IFS=$'\n'
	for files in $(find $user -name '*.jpg' -o -name '*.mp4' -o -name '*.mp3')
	do
		case $files in
			*.mp4)
				MP4COUNT=$(expr $MP4COUNT + 1 )
				;;
			*.mp3)

				MP3COUNT=$(expr $MP3COUNT + 1 )
				;;
			*.jpg)

				JPGCOUNT=$(expr $JPGCOUNT + 1 )
				;;
		esac
	done # Fim do for do find

echo "Usuario: $(basename $user)"
echo "Arquivos JPG: $JPGCOUNT"
echo "Arquivos MP3: $MP3COUNT"
echo "Arquivos MP4: $MP4COUNT"
echo
done # Fim do For no /home

IFS=$OLDIFS

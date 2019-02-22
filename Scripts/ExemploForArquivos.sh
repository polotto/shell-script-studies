#!/bin/bash

for i in ../CursoShellScript/arquivos/*
do
	if [ -f $i  ]
	then
		echo "Verificando o arquivo $i"
		LINHAS=$(cat $i | wc -l)
		echo "O arquivo $i contem $LINHAS"
		echo
	fi
done

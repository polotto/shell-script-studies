#!/bin/bash

read -p "Digite o nome do arquivo: " ARQ
read -p "Caracteres para serem utilizados: " CARAC
read -p "Tamanho final do arquivo: " TAM

if ls "$ARQ" > /dev/null 2>&1
then
	rm -r "$ARQ"
fi

POR=10

echo "Gerando o arquivo..."

while : ;
do
	echo "$CARAC" >> $ARQ
	
	TAM_ARQ=$(stat -c '%s' "$ARQ")
	
	POR_C=$(bc -l <<< "scale=0; ($TAM_ARQ*100)/$TAM")	
		
	if [ $POR_C -ge $POR ]
	then
		echo "Concluido: $POR - Tamanho do Arquivo: $TAM_ARQ"
		POR=$(expr $POR + 10)
	fi

	if [ $TAM_ARQ -ge $TAM  ]
	then
		break
	fi
done

echo "Pronto!"

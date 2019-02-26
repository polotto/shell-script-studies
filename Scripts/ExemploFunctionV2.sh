#!/bin/bash

ler () {
	read -p "Informe o nome: " NOME
	read -p "Informe o Sobrenome: " SOBRENOME
	return 10
}

ler
RETURN_CODE=$?
echo "Return code = $?"
echo $NOME $SOBRENOME

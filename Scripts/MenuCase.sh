#!/bin/bash

# Exibição do menu
clear
echo "escolha uma opção do menu:"
echo
echo "1 - adicionar"
echo "2 - remover"
echo "3 - alterar"
echo "q - sair"
echo
read -p "opção: " opcao
echo

# rotinas das opções
case "$opcao" in
	1)
		echo "oção 1 escolhida"
		echo "iniciar operação de inclusão"
		sleep 3
		;;
	2)
		echo "opção 2 escolhida"
		echo "iniciar operação de remoção..."
		sleep 3
		;;
	3)
		echo "opção 3 escolhida"
		echo "iniciar operação de alteração..."
		sleep 3
		;;
	q)
		echo "saindo..."
		sleep 3
		exit 0
		;;
	*)
		echo "opção inválida"
		exit 2
		;;
esac

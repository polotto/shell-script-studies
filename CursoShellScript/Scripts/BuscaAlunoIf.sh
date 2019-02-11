#!/bin/bash

#########################################################################
# 									#
# ExemploIf.sh - Exemplo do uso da instrução if				#
#									#
# Autor: Ricardo Prudenciato (ricardo@linuxsemfronteiras.com.br)	#
# Data Criação: DD/MM/YYYY						#
#									#
# Descrição: Script de exemplo para o if.	 			#
#									#
# Exemplo de uso: ./ExemploIf.sh					#
#									#
#########################################################################

ARQALUNOS="/home/ricardo/Cursos/ShellScript/arquivos/alunos2.txt"

clear
echo "======= Script de Busca de Alunos ========"
echo 

if [ $# -gt 0 ]
then
   ALUNOCOMPLETO=$(grep "$1" "$ARQALUNOS")
   echo "O nome completo do aluno é: "$ALUNOCOMPLETO""
else
   echo "Informe o nome do aluno como parâmetro!"
fi

echo
echo "Fim do Script"

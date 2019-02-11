#!/bin/bash

#########################################################################
# 									#
# BuscaAluno.sh - Procurar nome completo do aluno			#
#									#
# Autor: Ricardo Prudenciato (ricardo@linuxsemfronteiras.com.br)	#
# Data Criação: DD/MM/YYYY						#
#									#
# Descrição: Script de exemplo para o uso de parametros			#
#	     A partir de uma entrada do usuário, será feita uma		#
#	     busca no arquivo alunos2.txt				#
#									#
# Exemplo de uso: ./BuscaAlunos.sh					#
#									#
#########################################################################

ARQALUNOS="/home/ricardo/Cursos/ShellScript/arquivos/alunos2.txt"

clear
echo "======= Script de Busca de Alunos ========"
echo ""

ALUNOCOMPLETO=$(grep "$1" $ARQALUNOS)

echo ""
echo "O nome completo do aluno é: $ALUNOCOMPLETO"
echo ""
echo "Fim do Script"

#!/bin/bash

##############################################
#
# PrimeiroScript.sh - Script de Exemplo do Curso
#
# Autor: Polotto (@gmail.com)
# Data Criação: DD/MM/YYYY
#
# Descrição: Script de exemplo que lê data e hora atual e exibe a lista de alunos
# 
# Exemplo de uso: ./PrimeiroScript.sh
#
# Alteracoes
#	Dia X - Inclusao da Função de ordenação
#	Dia Y - Correcao da Função de leitura
#
###############################################

DATAHORA=$(date +%H:%M)
ARQUIVOALUNOS="$HOME/Documents/shell-script-studies/CursoShellScript/arquivos/alunos2.txt"

# Função de leitura da data e hora
clear
echo "===== Meu Primeiro Script ====="
echo ""
echo "Exibir data e hora atual: $DATAHORA "

# Area de leitura da lista de alunos
echo "==============================="
echo "Listagem dos Alunos: "
sort $ARQUIVOALUNOS # Caminho do arquivo relativo 

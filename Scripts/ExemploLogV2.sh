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
ARQUIVOALUNOS="$HOME/CursoShellScript/arquivos/alunos2.txt"

# Função de leitura da data e hora

echo "$(date) - Iniciando o Script..." | logger -p local0.warn -t [$0]

clear
echo "===== Meu Primeiro Script ====="
echo ""
echo "Exibir data e hora atual: $DATAHORA "

# Area de leitura da lista de alunos
echo "==============================="
echo "Listagem dos Alunos: "
sort $ARQUIVOALUNOS | tee -a >(logger -p local0.warn -t [$0]) # Caminho do arquivo relativo 

DATAHORA=$(date +%H)
echo "==============================="
echo "Nova Hora Atual: $DATAHORA"

# echo "$(date) - Fim do Script..."
logger -p local0.warn -t [$0] "Fim do Script"

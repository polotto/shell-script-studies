#!/bin/bash

#######################################
#
# PrimeiroScript.sh - Script de Exemplo do Curso
#
# Autor: Ricardo Prudenciato (rprudenciato@gmail.com)
# Data Criação: DD/MM/YYYY
#
# Descrição: Script de exemplo que le data e hora atual e exibe a lista de alunos
#
# Exemplo de uso: ./PrimeiroScript.sh
#
# Alteracoes
#	Dia X - Inclusao da Função de ordenacao
#	Dia Y - Correcao da Função de leitura
#
################################################

DATAHORA=$(date +%H:%M)
ARQALUNOS="/home/ricardo/Cursos/ShellScript/arquivos/alunos2.txt"

# Funcao de leitura da data e hora

echo "Iniciando o Script..." | logger -p local0.warn -t [$0] 
$logger -p local0.warn -t [$0] "Iniciando o Script"

clear
echo "===== Meu Primeiro Script ======="
echo 
echo "Exibir data e hora atual: $DATAHORA"

# Area de leitura da lista de alunos
echo "================================="
echo "Listagem dos Alunos: "
sort $ARQALUNOS | tee -a >(logger -p local0.warn -t [$0]) 

DATAHORA=$(date +%H)
echo "================================="
echo "Nova Hora Atual: $DATAHORA"

#echo "$(date) - Fim do Script..." >> $LOG
logger -p local0.warn -t [$0] "Fim do Script"


echo "Script Executado com Sucesso" |mail -s "Relatorio de Execucao do $0" ricardo




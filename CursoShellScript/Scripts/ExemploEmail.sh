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
ADMIN=ricardo@linuxsemfronteiras.com.br

# Funcao de leitura da data e hora

CONTEUDO="$(date): Iniciando o Script\n"
#echo "$(date): Iniciando o Script" >> /tmp/msg_temp 

clear
echo "===== Meu Primeiro Script ======="
echo 
echo "Exibir data e hora atual: $DATAHORA"
sleep 5
# Area de leitura da lista de alunos
echo "================================="
echo "Listagem dos Alunos: "
sort $ARQALUNOS

DATAHORA=$(date +%H)
echo "================================="
echo "Nova Hora Atual: $DATAHORA"

CONTEUDO="$CONTEUDO$(date): Fim do Script\n"

#echo "$(date): Script Finalizado" >> /tmp/msg_temp
echo -e "$CONTEUDO" |mail -s "Relatorio do Script $0" $ADMIN 

#mail -s "Relatorio de Execucao do $0" $ADMIN < /tmp/msg_temp

#rm -f /tmp/msg_temp

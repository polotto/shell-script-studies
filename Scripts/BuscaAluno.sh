#!/bin/bash

ARQALUNOS="../CursoShellScript/arquivos/alunos2.txt"

clear
echo "=========== script de busca de alunos ============"
echo ""
#echo -n "Por favor, informe o nome do aluno: "
#read ALUNO
read -p "Por favor, informe o nome do aluno: " ALUNO

ALUNOCOMPLETO=$(grep "$ALUNO" $ARQALUNOS)

echo ""
echo "O nome completo do aluno é: $ALUNOCOMPLETO"
echo ""
echo "fim do programa"

#!/bin/bash

ARQALUNOS="../CursoShellScript/arquivos/alunos2.txt"

clear
echo "=========== script de busca de alunos ============"
echo ""

ALUNOCOMPLETO=$(grep "$1" $ARQALUNOS)

echo ""
echo "O nome completo do aluno é: $ALUNOCOMPLETO"
echo ""
echo "fim do programa"

#!/bin/bash

ARQALUNOS="../CursoShellScript/arquivos/alunos2.txt"

clear
echo "=========== script de busca de alunos ============"
echo ""

if test $# -gt 0
then
	ALUNOCOMPLETO=$(grep "$1" $ARQALUNOS)
	echo
	echo "O nome completo do aluno é: $ALUNOCOMPLETO"
else
	echo "Informe o nome do aluno como parâmetro!"
fi

echo
echo "fim do programa"

#!/bin/bash

read -p "Qual o(a) melhor aluno(a): " MELHOR

for i in $(cat ../CursoShellScript/arquivos/alunos2.txt)
do
	if [ $i = $MELHOR ]
	then
		echo "A $i é a melhor aluna"
		break
	fi
	echo "Aluno(a): $i"
done

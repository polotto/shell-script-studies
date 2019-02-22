read -p "Valor 1: " VAL1
read -p "Valor 2: " VAL2
echo

if [ ! $VAL1  ] || [ ! $VAL2 ]
then
	echo "Nunhum dos valores pode ser nulo"
	exit 1
fi

echo "Escolha uma operação:"
echo -e "1 = soma\n2 = subtração\n3 = multiplicação\n4 = divisão\nQ = sair"
echo

read -p "Opção: " OPT
echo

case $OPT in
	1)
		echo "$VAL1 + $VAL2 = $(expr "$VAL1" + "$VAL2" )"
		;;
	2)
		echo "$VAL1 + $VAL2 = $(expr "$VAL1" - "$VAL2" )"
		;;
	3)
		if [ $VAL1 -eq 0 -o $VAL2 -eq 0 ]
		then
			echo "Um valor 0 não pode ser utilizado em uma multiplicação"
			exit 1
		fi
		echo "$VAL1 + $VAL2 = $(expr "$VAL1" \* "$VAL2" )"
		;;
	4)
		if [ $VAL1 -eq 0 -o $VAL2 -eq 0 ]
		then
			echo "Um valor 0 não pode ser utilizado em uma divisão"
			exit 1
		fi
		RES=$(expr "$VAL1" % "$VAL2")
		if [ $RES -ne 0 ]
		then
			echo "Divisão com resto = $RES"
		else
			echo "Divisão exata"
		fi
		echo "$VAL1 + $VAL2 = $(expr "$VAL1" / "$VAL2" )"
		;;
	Q)
		echo "Saindo..."
		exit
		;;
	*)
		echo "Opção inválida"
		exit 1
		;;
esac

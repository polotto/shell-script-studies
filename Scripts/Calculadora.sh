read -p "Valor 1: " VAL1
read -p "Valor 2: " VAL2
echo

echo "Escolha uma operação:"
echo -e "1 = soma\n2 = subtração\n3 = multiplicação\n4 = diivisão\nQ = sair"
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
		echo "$VAL1 + $VAL2 = $(expr "$VAL1" \* "$VAL2" )"
		;;
	4)
		echo "Divisão com resto = $(expr "$VAL1" % "$VAL2")"
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

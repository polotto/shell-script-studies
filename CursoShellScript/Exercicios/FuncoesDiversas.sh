#!/bin/bash

#########################################################################
# Exercício 1 - Funções 						#
#									#	
# Nome: FuncoesDiversas.sh						#
#									#
# Autor: Ricardo Prudenciato (ricardo@linuxsemfronteiras.com.br)	#
# Data: DD/MM/AAAA							#
#									#
# Descrição: Script com diversas funções que fazem			#
# tratamentos com datas						 	#
#									#
# Uso: ./FuncoesDiversas.sh --help					#
#      ./FuncoesDiversas.sh OPÇÃO DATA					#
#									#
# Opções:								#
# -f = Retorna 0 para BR, 1 para US, 2 quando impossível determinar	#
#      e 3 para formato de data inválido				#
# -i = Inverte formato BR para US e US para BR. Inclui as Barras	#
# -b = Inclui Barras de Data. Exemplo: de 13081981 para 13/08/1981	#
# -e = Exibe a data em formato extenso. Exemplo de 13081981 		#
#      para 13 de Agosto de 1981 					#
#									#
#########################################################################

DATA=$(echo $2|tr -d "/")
VAL1=$(echo $DATA|cut -c-2)
VAL2=$(echo $DATA|cut -c3-4)
ANO=$(echo $DATA|cut -c5-8)

RetornaFormato () {
# A função retorna 0 para data em formato BR (DDMMYYYY), 1 para formato US (MMDDYYYY)
# e 2 quando é impossível determinar. Quando dia = mês, considera-se formato BR. 
# Retorna 3 para formato inválido
	if [ $VAL1 -le 12 -a $VAL1 -eq $VAL2 ]  # Dia = Mes = Formato BR
	then
		return 0
	elif [ $VAL1 -gt 12 -a $VAL2 -le 12 ]   # Formato BR
	then
		return 0
	elif [ $VAL1 -le 12 -a $VAL2 -gt 12 ]   # Formato US
	then
		return 1
	elif [ $VAL1 -le 12 -a $VAL2 -le 12 ]  	# Formato Indefinido, mas válido
	then
		return 2
	else
		return 3
	fi
}

InverteDiaMes () {
# Função que inverte os valores do dia com mês e retorna o valor
	RetornaFormato $1
	local FORMATO=$?
	if [ $FORMATO -ne 3 ]
	then	
		echo $VAL2/$VAL1/$ANO
	else
		echo "Formato de Data Invalido"
	fi
} 

IncluiBarra () {
# Função que inclui uma barras na data
	RetornaFormato $1
	local FORMATO=$?
	if [ $FORMATO -ne 3 ]
	then	
		echo "$VAL1/$VAL2/$ANO"
	else
		echo "Formato de Data Invalido"
	fi
}

DataExtenso () {
# Função que recebe uma data em formato BR e exibe a data em formato extenso
	RetornaFormato $1
	local RETURN_FORM=$?
	case $RETURN_FORM in
		0)				# Data em Formato BR
			local DIA=$VAL1
			local MES=$VAL2
			;;
		1)				# Data em Formato US
			local DIA=$VAL2
			local MES=$VAL1
			;;
		2)				# Formato Indefinido. Solicitar ao Usuário
			local FORMATO=0
			until [ "$FORMATO" = 1 -o "$FORMATO" = 2 ]
			do
				echo
				echo "Impossível determinar o padrão de data."
				echo "1 - BR (DD/MM/YYYY)"
				echo "2 - US (MM/DD/YYYY)"
				read -p "Informe o formato (1 ou 2): " FORMATO
				case $FORMATO in
					1)
						local DIA=$VAL1
						local MES=$VAL2
						;;
					2)
						local DIA=$VAL2
						local MES=$VAL1
						;;
					*)
						echo "Opção Inválida"
						;;
				esac
			done
			echo
			;;
		3)
			echo "Formato de Data Invalido"
			exit 3
			;;
	esac

	case $MES in
	01)
		local MESEXT=Janeiro
		;;
	02)
		local MESEXT=Fevereiro
		;;
	03)
		local MESEXT=Março
		;;
	04)
		local MESEXT=Abril
		;;
	05)
		local MESEXT=Maio
		;;
	06)
		local MESEXT=Junho
		;;
	07)
		local MESEXT=Julho
		;;
	08)
		local MESEXT=Agosto
		;;
	09)
		local MESEXT=Setembro
		;;
	10)
		local MESEXT=Outubro
		;;
	11)
		local MESEXT=Novembro
		;;
	12)
		local MESEXT=Dezembro
		;;
esac
echo "$DIA de $MESEXT de $ANO"
}


############################
# Inicio do Fluxo do Script
############################

case $1 in
	"-f")
		RetornaFormato $2
		echo $?
		;;
	"-i")
		InverteDiaMes $2
		;;
	"-b")
		IncluiBarra $2
		;;
	"-e")	
		DataExtenso $2
		;;
	"--help")
		echo "Uso $0 OPÇÃO DATA"
		echo
		echo "DATA nos formatos DDMMYYYY ou MMDDYYYY, com ou sem /"
		echo
		echo "Opções:"
		echo "-f = Retorna 0 para BR, 1 para US e 2 quando impossível determinar, 3 Inválido"
		echo "-i = Inverte formato BR para US e US para BR. Inclui as Barras"
		echo "-b = Inclui Barras de Data. Exemplo: de 13081981 para 13/08/1981"
		echo "-e = Exibe a data em formato extenso. Exemplo de 13081981 para 13 de Agosto de 1981 "
		;;
	*)
		echo "Uso indevido. Utilize $0 --help"
		;;
esac

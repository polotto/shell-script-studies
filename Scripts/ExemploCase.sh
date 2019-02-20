#!/bin/bash

case "$1" in
	[0-9])
		echo "o parâmetro é um número"
		;;
	[A-Z])
		echo "o parâmetro é uma letra maiúscula"
		;;
	[a-z])
		echo "o parâmetro é uma letra minúscula"
		;;
esac

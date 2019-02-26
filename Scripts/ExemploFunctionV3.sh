#!/bin/bash

adiciona () {
	soma=$(expr $1 + $2)
	return $soma
}

adiciona 10 20
echo "o resultado foi $?"

echo $1 $2

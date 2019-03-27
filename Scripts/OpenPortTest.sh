#!/bin/bash

LOG="./OpenPorts.txt"
TIMEOUT=1
MIN_PORT=5001
MAX_PORT=49151

exec 1>> >(tee -a "$LOG")
exec 2>&1

echo
echo
echo "$(date) - Iniciando o teste de portas"

for PORT in $(seq $MIN_PORT $MAX_PORT)
do
	echo -n "-> Testando porta $PORT"
	curl --max-time "$TIMEOUT" "http://portquiz.net:$PORT" > /dev/null 2>&1

	if [ $? -eq 0 ]
	then
		echo " --> A porta $PORT está disponível"
	else
		echo " --> A porta $PORT NÃO está disponível"
	fi
done

echo

#!/bin/bash

until ps axu | grep firefox | grep -v grep > /dev/null
do
	echo inicie o firefox
	sleep 3
	echo
done

echo firefox iniciado.
echo PID: $(pgrep firefox)

#!/bin/bash

LOG="./OpenPorts.txt"
URL="http://portquiz.net"
CURL_STD_OUT="/dev/null"
CURL_ERR_OUT="/dev/null"
TIMEOUT=1
# Port range to any proposal TCP use: 5001-49151
# Source: http://cubicspot.blogspot.com/2016/04/need-random-tcp-port-number-for-your.html
# Random gen: https://www.random.org/integers/?num=1&min=5001&max=49151&col=5&base=10&format=html&rnd=new
MIN_PORT=5001
MAX_PORT=49151

exec 1>> >(tee -a "$LOG")
exec 2>&1

echo
echo
echo "$(date) - Script is running..."
echo "************************* Configurations ********************************"
echo "LOG: $LOG"
echo "CURL_STD_OUT: $CURL_STD_OUT - CURL_ERR_OUT: $CURL_ERR_OUT"
echo "TIMEOUT: $TIMEOUT"
echo "MIN_PORT: $MIN_PORT - MAX_PORT: $MAX_PORT"
echo "*************************************************************************"
echo "$(date) - Starting open port test (ref url: $URL)..."

for PORT in $(seq $MIN_PORT $MAX_PORT)
do
	echo -n "-> Testing port: $PORT"
	curl --max-time "$TIMEOUT" "$URL:$PORT" >$CURL_STD_OUT 2>$CURL_ERR_OUT

	if [ $? -eq 0 ]
	then
		echo " --> the port $PORT is open! (exit code: $?)"
	else
		echo " --> the port $PORT isnt open :-( (exit code: $?)"
	fi
done

echo "$(date) - Open port testing finished."
echo

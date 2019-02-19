#!/bin/bash

clear

echo "================================================="
echo "Relatório da máquina: $HOSTNAME"
echo "Data/Hora: $(date)"
echo "================================================="

# https://superuser.com/a/422747
echo "Máquina ativa desde: $(uptime -s)"
echo ""

# https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
echo "Versão do kernel: $(uname -r)"
echo ""

echo "CPUs:"

######## Mac Only ########
# https://github.com/memkind/memkind/issues/33
# echo "Quantidade de CPUs/Core: $(sysctl -n hw.physicalcpu)"
##########################

# https://unix.stackexchange.com/questions/218074/how-to-know-number-of-cores-of-a-system-in-linux
# echo "Quantidade de CPUs/Core: $(nproc --all)"
echo "Quantidade de CPUs/Core: $(cat /proc/cpuinfo | grep "cpu cores" | uniq | cut -d" " -f3)"
# echo "Quantidade de CPUs/Core: $(cat /proc/cpuinfo | grep "model name" | wc -l)"

# https://www.tecmint.com/check-linux-cpu-information/
echo "Modelo da CPU: $(cat /proc/cpuinfo| egrep "model name" | uniq | cut -d" " -f4-)"
echo ""

# https://www.cyberciti.biz/faq/linux-ram-info-command/
echo "Memória toal: $(expr $(cat /proc/meminfo | grep "MemTotal"| cut -d" " -f9- | tr -d " kB") / 1024)" #valor em MB
echo ""

echo "Partições:"
echo "$(df -h | egrep -v '(tmpfs|udev)')"

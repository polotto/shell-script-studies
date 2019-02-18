#!/bin/bash

echo "================================================="
echo "Relatório da máquina: $HOSTNAME"
echo "Data/Hora: $(date)"
echo "================================================="
# https://superuser.com/a/422747
echo "Máquina ativa desde: $(who -b| cut -d' ' -f12-)"
echo ""
# https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
echo "Versão do kernel: $(uname -r)"
echo ""
echo "CPUs:"
# https://github.com/memkind/memkind/issues/33
echo "Quantidade de CPUs/Core: $(sysctl -n hw.physicalcpu)"
# https://unix.stackexchange.com/questions/218074/how-to-know-number-of-cores-of-a-system-in-linux
echo "Quantidade de CPUs/Core: $(nproc --all)"
# https://www.tecmint.com/check-linux-cpu-information/
echo "Modelo da CPU: $(cat /proc/cpuinfo| egrep "model name"| uniq)"
echo ""
# https://www.cyberciti.biz/faq/linux-ram-info-command/
echo "Memória toal: $(cat /proc/meminfo | grep "MemTotal"| cut -d" " -f9-)"
echo ""
echo "Partições:"


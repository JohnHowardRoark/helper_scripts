#!/bin/bash

clear

for i in {30..37}
do
    j=$((i + 10))
    echo -en "\e[00;${j}m ${j} \e[0m"
    echo -en "\e[00;${i}m ${i} \e[0m"
done
    echo

echo -e "\e[00;38;05;002m 00;38;05;002 \e[0m"
echo -e "\e[00;48;05;002m 00;48;05;002 \e[0m"

RESTORE='\033[0m'
# MY_GREEN='\033[0;002m'

RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
LIGHTGRAY='\033[00;37m'

LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'

#!/bin/bash

# Define some colors first:
red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m' # No Color

echo -e "${CYAN}This is BASH ${RED}${BASH_VERSION%.*}${CYAN} - DISPLAY on ${RED}$DISPLAY${NC}\n" date 

if [ -x /usr/games/fortune ]; then
	/usr/games/fortune -s # makes our day a bit more fun.... :-)
fi

function printit() # function to run upon exit of shell
{
	echo -e "\033[1mThis is bold text.\033[0m"
	clear
	echo -e "${RED}"
	echo $1
	echo -e "${NC}"
}

printit $(pwd)

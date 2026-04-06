#!/bin/bash

# Culori pentru design
GREEN='\033[0;32m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
RED='\033[0;31m'
NC='\033[0m' # No Color

function banner() {
    clear
    echo -e "${GREEN}"
    echo ' ________  ________  ________   ________        ___  ___     '
    echo '|\   ____\|\   __  \|\   ___  \|\   __  \      |\  \|\  \    '
    echo '\ \  \___|\ \  \|\  \ \  \\ \  \ \  \|\  \     \ \  \ \  \   '
    echo ' \ \_____  \ \   __  \ \  \\ \  \ \  \\\  \  __ \ \  \ \  \  '
    echo '  \|____|\  \ \  \ \  \ \  \\ \  \ \  \\\  \|\  \\_\  \ \  \ '
    echo '    ____\_\  \ \__\ \__\ \__\\ \__\ \_______\ \________\ \__\'
    echo '   |\_________\|__|\|__|\|__| \|__|\|_______|\|________|\|__|'
    echo '   \|_________|                                              '
    echo -e "${NC}"
    echo -e "${WHITE}      [ SANOJ MULTI-TOOL v4 - KALI EDITION ]${NC}"
    echo "------------------------------------------------------------"
}

function run_tool() {
    name=$1
    repo=$2
    folder=$3
    exec_file=$4

    # Verificăm dacă folderul tools există
    mkdir -p tools

    if [ ! -d "tools/$folder" ]; then
        echo -e "${CYAN}[*] Instalare $name...${NC}"
        git clone $repo tools/$folder
    fi

    echo -e "${GREEN}[+] Pornesc $name...${NC}"
    cd tools/$folder
    
    # Rulăm în funcție de extensie
    if [[ $exec_file == *.sh ]]; then
        chmod +x $exec_file
        bash $exec_file
    elif [[ $exec_file == *.py ]]; then
        python3 $exec_file
    else
        python3 $exec_file # default
    fi
    
    cd ../..
    read -p "Apasă Enter pentru a te întoarce la meniu..."
}

while true; do
    banner
    echo -e "${CYAN}[1]${NC} ZPhisher (Phishing)"
    echo -e "${CYAN}[2]${NC} IP-Tracker (OSINT)"
    echo -e "${CYAN}[3]${NC} Hammer (DDoS)"
    echo -e "${CYAN}[4]${NC} Admin Finder"
    echo -e "${RED}[E]${NC} Exit"
    echo ""
    read -p "sanoj@kali:~$ " choice

    case $choice in
        1) run_tool "ZPhisher" "https://github.com/htr-tech/zphisher" "zphisher" "zphisher.sh" ;;
        2) run_tool "IP-Tracker" "https://github.com/v1ncent-vic3/IP-Info" "ip-info" "ipinfo.py" ;;
        3) run_tool "Hammer" "https://github.com/cyweb/hammer" "hammer" "hammer.py" ;;
        4) run_tool "Admin Finder" "https://github.com/the-c0d3r/admin-finder" "admin-finder" "admin-finder.py" ;;
        e|E) echo "Bye!"; exit ;;
        *) echo -e "${RED}Opțiune invalidă!${NC}"; sleep 1 ;;
    esac
done
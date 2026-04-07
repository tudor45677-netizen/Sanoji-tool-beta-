#!/bin/bash

# [!] VERIFICARE PERMISIUNI: Daca nu e rulat cu sudo, cere parola automat
if [[ $EUID -ne 0 ]]; then
   echo -e "\e[1;31m[!] Acest script are nevoie de drepturi de administrator (root).\e[0m"
   sudo "$0" "$@"
   exit $?
fi

# Culori Rainbow
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
WHITE='\033[1;37m'
NC='\033[0m'

function banner() {
    clear
    echo -e "${RED} ________  ________  ________   ________         ___  ___     ${NC}"
    echo -e "${YELLOW}|\   ____\|\   __  \|\   ___  \|\   __  \       |\  \|\  \    ${NC}"
    echo -e "${GREEN}\ \  \___|\ \  \|\  \ \  \\\\ \  \ \  \|\  \      \ \  \ \  \   ${NC}"
    echo -e "${CYAN} \ \_____  \ \   __  \ \  \\\\ \  \ \  \\\\\\  \  __ \ \  \ \  \  ${NC}"
    echo -e "${BLUE}  \|____|\  \ \  \ \  \ \  \\\\ \  \ \  \\\\\\  \|\  \\_\  \ \  \ ${NC}"
    echo -e "${MAGENTA}    ____\_\  \ \__\ \__\ \__\\ \__\ \_______\ \________\ \__\\${NC}"
    echo -e "${RED}   |\_________\|__|\|__|\|__| \|__|\|_______|\|________|\|__|${NC}"
    echo -e "${YELLOW}   \|_________|                                              ${NC}"
    echo -e "${WHITE}    ----------------------------------------------------------${NC}"
    echo -e "${GREEN}                 [ SANOJI UNIVERSAL - 25 TOOLS ]${NC}"
    echo -e "${WHITE}    ----------------------------------------------------------${NC}"
}

function run_tool() {
    name=$1
    repo=$2
    folder=$3
    exec_file=$4
    cmd=$5

    # Rezolva problema de permisiuni pentru folderul tools
    mkdir -p tools
    chmod 777 tools

    if [ ! -d "tools/$folder" ]; then
        echo -e "${CYAN}[*] Descarcare $name...${NC}"
        git clone $repo tools/$folder
        chmod -R 777 tools/$folder
    fi

    echo -e "${GREEN}[+] Pornesc $name...${NC}"
    cd tools/$folder
    chmod +x $exec_file 2>/dev/null
    
    if [ "$cmd" == "python3" ]; then
        python3 $exec_file
    elif [ "$cmd" == "bash" ]; then
        bash $exec_file
    else
        ./$exec_file
    fi
    
    cd ../..
    read -p "Apasă ENTER pentru meniu..."
}

while true; do
    banner
    echo -e "${GREEN} [01] ZPhisher            [14] Admin Finder${NC}"
    echo -e "${GREEN} [02] HiddenEye (Mirror)  [15] WhatWeb${NC}"
    echo -e "${GREEN} [03] SocialPhish         [16] RouterSploit${NC}"
    echo -e "${GREEN} [04] Seeker (GPS)        [17] Slowloris (DoS)${NC}"
    echo -e "${GREEN} [05] BlackEye            [18] Hammer (DDoS)${NC}"
    echo -e "${GREEN} [06] Sherlock            [19] Instashell${NC}"
    echo -e "${GREEN} [07] PhoneInfoga         [20] FaceBash${NC}"
    echo -e "${GREEN} [08] IP-Tracker          [21] TheHarvester${NC}"
    echo -e "${GREEN} [09] Recon-Dog           [22] Photon${NC}"
    echo -e "${GREEN} [10] BillCipher          [23] GHunt${NC}"
    echo -e "${GREEN} [11] SQLMap              [24] Cupp (Wordlist)${NC}"
    echo -e "${GREEN} [12] Nmap                [25] Hash-Buster${NC}"
    echo -e "${GREEN} [13] Nikto${NC}"
    
    echo -e "\n${RED} [EE] EXIT TERMINAL${NC}"
    echo -e "${WHITE} ----------------------------------------------------------${NC}"
    read -p " sanoji@kali:~$ " choice

    case $choice in
        1) run_tool "ZPhisher" "https://github.com/htr-tech/zphisher" "zphisher" "zphisher.sh" "bash" ;;
        2) run_tool "HiddenEye" "https://github.com/Mebus/HiddenEye" "HiddenEye" "HiddenEye.py" "python3" ;;
        3) run_tool "SocialPhish" "https://github.com/xHak9x/SocialPhish" "socialphish" "socialphish.sh" "bash" ;;
        4) run_tool "Seeker" "https://github.com/thewhiteh4t/seeker" "seeker" "seeker.py" "python3" ;;
        5) run_tool "BlackEye" "https://github.com/An0nUD4Y/blackeye" "blackeye" "blackeye.sh" "bash" ;;
        6) run_tool "Sherlock" "https://github.com/sherlock-project/sherlock" "sherlock" "sherlock.py" "python3" ;;
        7) run_tool "PhoneInfoga" "https://github.com/sundowndev/phoneinfoga" "phoneinfoga" "phoneinfoga.py" "python3" ;;
        8) run_tool "IP-Tracker" "https://github.com/v1ncent-vic3/IP-Info" "ip-info" "ipinfo.py" "python3" ;;
        9) run_tool "Recon-Dog" "https://github.com/s0md3v/ReconDog" "recondog" "dog.py" "python3" ;;
        10) run_tool "BillCipher" "https://github.com/GitHackTools/BillCipher" "billcipher" "billcipher.py" "python3" ;;
        11) run_tool "SQLMap" "https://github.com/sqlmapproject/sqlmap" "sqlmap" "sqlmap.py" "python3" ;;
        12) run_tool "Nmap" "https://github.com/nmap/nmap" "nmap" "configure" "bash" ;;
        13) run_tool "Nikto" "https://github.com/sullo/nikto" "nikto" "program/nikto.pl" "./" ;;
        14) run_tool "Admin Finder" "https://github.com/the-c0d3r/admin-finder" "admin-finder" "admin-finder.py" "python3" ;;
        15) run_tool "WhatWeb" "https://github.com/urbanurbanist/WhatWeb" "whatweb" "whatweb" "./" ;;
        16) run_tool "RouterSploit" "https://github.com/threat9/routersploit" "routersploit" "rsf.py" "python3" ;;
        17) run_tool "Slowloris" "https://github.com/gkbrk/slowloris" "slowloris" "slowloris.py" "python3" ;;
        18) run_tool "Hammer" "https://github.com/cyweb/hammer" "hammer" "hammer.py" "python3" ;;
        19) run_tool "Instashell" "https://github.com/thelinuxchoice/instashell" "instashell" "instashell.sh" "bash" ;;
        20) run_tool "FaceBash" "https://github.com/thelinuxchoice/facebash" "facebash" "facebash.sh" "bash" ;;
        21) run_tool "TheHarvester" "https://github.com/laramies/theHarvester" "theharvester" "theHarvester.py" "python3" ;;
        22) run_tool "Photon" "https://github.com/s0md3v/Photon" "photon" "photon.py" "python3" ;;
        23) run_tool "GHunt" "https://github.com/mxrch/GHunt" "ghunt" "ghunt.py" "python3" ;;
        24) run_tool "Cupp" "https://github.com/Mebus/cupp" "cupp" "cupp.py" "python3" ;;
        25) run_tool "Hash-Buster" "https://github.com/s0md3v/Hash-Buster" "hashbuster" "hash.py" "python3" ;;
        ee|EE) exit ;;
        *) echo -e "${RED}Alegere invalida!${NC}"; sleep 1 ;;
    esac
done
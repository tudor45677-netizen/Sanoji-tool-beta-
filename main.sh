#!/bin/bash

# Culori
GREEN='\033[0;32m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

function banner() {
    clear
    echo -e "${GREEN}"
    echo ' ________  ________  ________   ________         ___  ___     '
    echo '|\   ____\|\   __  \|\   ___  \|\   __  \       |\  \|\  \    '
    echo '\ \  \___|\ \  \|\  \ \  \\ \  \ \  \|\  \      \ \  \ \  \   '
    echo ' \ \_____  \ \   __  \ \  \\ \  \ \  \\\  \  __ \ \  \ \  \  '
    echo '  \|____|\  \ \  \ \  \ \  \\ \  \ \  \\\  \|\  \\_\  \ \  \ '
    echo '    ____\_\  \ \__\ \__\ \__\\ \__\ \_______\ \________\ \__\'
    echo '   |\_________\|__|\|__|\|__| \|__|\|_______|\|________|\|__|'
    echo '   \|_________|                                              '
    echo -e "${NC}"
    echo -e "${WHITE}      [ SANOJ MULTI-TOOL v5 - MEGA EDITION ]${NC}"
    echo "------------------------------------------------------------"
}

function run_tool() {
    name=$1
    repo=$2
    folder=$3
    exec_file=$4
    cmd=$5 # Am adăugat cmd pentru a specifica dacă e bash, python3 etc.

    mkdir -p tools
    if [ ! -d "tools/$folder" ]; then
        echo -e "${CYAN}[*] Instalare $name...${NC}"
        git clone $repo tools/$folder
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
    read -p "Apasă Enter pentru meniu..."
}

while true; do
    banner
    echo -e "${YELLOW}--- PHISHING & SOCIAL ENGINEERING ---${NC}"
    echo -e "${CYAN}[1]${NC} ZPhisher       ${CYAN}[2]${NC} HiddenEye      ${CYAN}[3]${NC} Social-Phish"
    
    echo -e "\n${YELLOW}--- INFORMATION GATHERING (OSINT) ---${NC}"
    echo -e "${CYAN}[4]${NC} IP-Tracker     ${CYAN}[5]${NC} Sherlock (Social Media) ${CYAN}[6]${NC} PhoneInfoga"
    echo -e "${CYAN}[7]${NC} Recon-Dog      ${CYAN}[8]${NC} BillCipher"
    
    echo -e "\n${YELLOW}--- WEB HACKING & VULNERABILITY ---${NC}"
    echo -e "${CYAN}[9]${NC} SQLMap         ${CYAN}[10]${NC} Nmap (PortScan) ${CYAN}[11]${NC} Nikto"
    echo -e "${CYAN}[12]${NC} Admin Finder  ${CYAN}[13]${NC} Adv-Phishing"
    
    echo -e "\n${YELLOW}--- EXPLOITATION & BRUTEFORCE ---${NC}"
    echo -e "${CYAN}[14]${NC} RouterSploit  ${CYAN}[15]${NC} Slowloris (DoS) ${CYAN}[16]${NC} Hammer (DDoS)"
    echo -e "${CYAN}[17]${NC} Instashell    ${CYAN}[18]${NC} FaceBash (FB Brute)"
    
    echo -e "\n${YELLOW}--- WIRELESS & OTHERS ---${NC}"
    echo -e "${CYAN}[19]${NC} WiFi-Py       ${CYAN}[20]${NC} Cupp (Wordlist Gen)"
    
    echo -e "\n${RED}[E] Exit${NC}"
    echo ""
    read -p "sanoj@kali:~$ " choice

    case $choice in
        1) run_tool "ZPhisher" "https://github.com/htr-tech/zphisher" "zphisher" "zphisher.sh" "bash" ;;
        2) run_tool "HiddenEye" "https://github.com/DarkSecDevelopers/HiddenEye" "HiddenEye" "HiddenEye.py" "python3" ;;
        3) run_tool "Social-Phish" "https://github.com/xHak9x/SocialPhish" "socialphish" "socialphish.sh" "bash" ;;
        4) run_tool "IP-Tracker" "https://github.com/v1ncent-vic3/IP-Info" "ip-info" "ipinfo.py" "python3" ;;
        5) run_tool "Sherlock" "https://github.com/sherlock-project/sherlock" "sherlock" "sherlock.py" "python3" ;;
        6) run_tool "PhoneInfoga" "https://github.com/sundowndev/phoneinfoga" "phoneinfoga" "phoneinfoga.py" "python3" ;;
        7) run_tool "Recon-Dog" "https://github.com/s0md3v/ReconDog" "recondog" "dog.py" "python3" ;;
        8) run_tool "BillCipher" "https://github.com/GitHackTools/BillCipher" "billcipher" "billcipher.py" "python3" ;;
        9) run_tool "SQLMap" "https://github.com/sqlmapproject/sqlmap" "sqlmap" "sqlmap.py" "python3" ;;
        10) run_tool "Nmap-Scan" "https://github.com/nmap/nmap" "nmap" "configure" "bash" ;; # Nmap e de obicei deja în Kali
        11) run_tool "Nikto" "https://github.com/sullo/nikto" "nikto" "program/nikto.pl" "./" ;;
        12) run_tool "Admin Finder" "https://github.com/the-c0d3r/admin-finder" "admin-finder" "admin-finder.py" "python3" ;;
        13) run_tool "Adv-Phishing" "https://github.com/Aditya02-Sharma/Adv-Phishing" "adv-phishing" "Adv-Phishing.sh" "bash" ;;
        14) run_tool "RouterSploit" "https://github.com/threat9/routersploit" "routersploit" "rsf.py" "python3" ;;
        15) run_tool "Slowloris" "https://github.com/gkbrk/slowloris" "slowloris" "slowloris.py" "python3" ;;
        16) run_tool "Hammer" "https://github.com/cyweb/hammer" "hammer" "hammer.py" "python3" ;;
        17) run_tool "Instashell" "https://github.com/thelinuxchoice/instashell" "instashell" "instashell.sh" "bash" ;;
        18) run_tool "FaceBash" "https://github.com/thelinuxchoice/facebash" "facebash" "facebash.sh" "bash" ;;
        19) run_tool "WiFi-Py" "https://github.com/ankit010jain/wifi-py" "wifi-py" "wifi-py.py" "python3" ;;
        20) run_tool "Cupp" "https://github.com/Mebus/cupp" "cupp" "cupp.py" "python3" ;;
        e|E) exit ;;
        *) echo "Eroare!"; sleep 1 ;;
    esac
done

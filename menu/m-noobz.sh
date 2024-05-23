#!/bin/bash

# Colors
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
red() { echo -e "\\033[32;1m${*}\\033[0m"; }

# Telegram settings
export CHATID=""
export KEY=""
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"

# Function to install NoobzVpn-Server
install_noobzvpn() {
    wget https://raw.githubusercontent.com/KochengVpn/noobzvpns/main/noobzvpns.zip
    unzip noobzvpns.zip
    cd noobzvpns
    bash install.sh
    rm noobzvpns.zip
    systemctl restart noobzvpns
}

# Function to add a new NoobVPN user
add_noobvpn_user() {
    clear
    echo -e "\033[1;93m---------------------------------------------------\033[0m"
    echo -e " NoobVPN Account    "
    echo -e "\033[1;93m---------------------------------------------------\033[0m"
    read -p " Username : " username
    read -p " Password : " password
    read -p "Enter expiration days (0 for unlimited): " days
    noobzvpns --add-user "$username" "$password"
    noobzvpns --expired-user "$username" "$days"
    echo "#nob# ${username} ${Password} ${days}" >>/etc/noobzvpns/.noobzvpns.db
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
    clear
    echo ""
    echo -e "\033[1;93m---------------------------------------------------\033[0m"
    echo -e " NoobVPN Account    "
    echo -e "\033[1;93m---------------------------------------------------\033[0m"
    echo -e "Username         : $username"
    echo -e "Password         : $password"
    echo -e "Host             : $domain"
    echo -e "\033[1;93m---------------------------------------------------\033[0m"
    echo -e "Aktif Selama     : $days Hari"
    echo -e "----------------------------------------------------------------------"
    echo -e "       Terima Kasih Telah Menggunakan     "
    echo -e "            Premium Script                      "
    echo -e "          KOCHENG TUNNELING             "
    echo -e "----------------------------------------------------------------------"
}

# Function to block a user
block_user() {
    read -p "Enter username to block: " username
    noobzvpns --block-user "$username"
}

# Function to unblock a user
unblock_user() {
    read -p "Enter username to unblock: " username
    noobzvpns --unblock-user "$username"
}

# Function to set expiration for a user
set_expiration() {
    read -p "Enter username: " username
    read -p "Enter expiration days (0 for unlimited): " days
    noobzvpns --expired-user "$username" "$days"
}

# Function to renew expiration for a user
renew_expiration() {
    read -p "Enter username to renew expiration: " username
    noobzvpns --renew-user "$username"
}

# Function to change password for a user
change_password() {
    read -p "Enter username: " username
    read -p "Enter new password: " new_password
    noobzvpns--password-user "$username" "$new_password"
}

# Function to rename a user
rename_user() {
    read -p "Enter current username: " old_username
    read -p "Enter new username: " new_username
    noobzvpns --rename-user "$old_username" "$new_username"
}

# Function to remove a user
remove_user() {
    read -p "Enter username to remove: " username
    noobzvpns --remove-user "$username"
}

# Function to remove all users
remove_all_users() {
    read -p "Are you sure you want to remove all users? (yes/no): " confirm
    if [ "$confirm" == "yes" ]; then
        noobzvpns --remove-all-user
    else
        echo "Operation cancelled."
    fi
}

# Function to get info for a user
info_user() {
    read -p "Enter username: " username
    noobzvpns --info-user "$username"
}

# Function to get info for all users
info_all_users() {
    noobzvpns --info-all-user
}

clear

# Permission checking
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear

ipsaya=$(wget -qO- ipv4.icanhazip.com)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
# data_ip="https://raw.githubusercontent.com/LT-BACKEND/REGISTER/main/IPVPS"

clear

#Domain
domain=$(cat /etc/xray/domain)

echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "                NoobzVpn Server Menu           "
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "  ${ORANGE}[1].${NC}\033[0;36m Install NoobzVpn-Server${NC}"
echo -e "  ${ORANGE}[2].${NC}\033[0;36m Add User${NC}"
echo -e "  ${ORANGE}[3].${NC}\033[0;36m Block User${NC}"
echo -e "  ${ORANGE}[4].${NC}\033[0;36m Unblock User${NC}"
echo -e "  ${ORANGE}[5].${NC}\033[0;36m Set Expiration${NC}"
echo -e "  ${ORANGE}[6].${NC}\033[0;36m Renew Expiration${NC}"
echo -e "  ${ORANGE}[7].${NC}\033[0;36m Change Password${NC}"
echo -e "  ${ORANGE}[8].${NC}\033[0;36m Rename User${NC}"
echo -e "  ${ORANGE}[9].${NC}\033[0;36m Remove User${NC}"
echo -e "  ${ORANGE}[10].${NC}\033[0;36m Remove All Users${NC}"
echo -e "  ${ORANGE}[11].${NC}\033[0;36m Info User${NC}"
echo -e "  ${ORANGE}[12].${NC}\033[0;36m Info All Users${NC}"
echo -e "  ${ORANGE}[13].${NC}\033[0;36m Exit${NC}"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"

read -p "Select an option [1 - 13]: " menu
echo -e ""

case $menu in
1) install_noobzvpn ;;
2) add_noobvpn_user ;;
3) block_user ;;
4) unblock_user ;;
5) set_expiration ;;
6) renew_expiration ;;
7) change_password ;;
8) rename_user ;;
9) remove_user ;;
10) remove_all_users ;;
11) info_user ;;
12) info_all_users ;;
13) exit ;;
*) echo "Invalid choice. Please enter a number between 1 and 13." ;;
esac

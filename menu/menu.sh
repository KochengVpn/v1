#!/bin/bash
MYIP=$(curl -sS ifconfig.me)
echo "Checking VPS"
clear
# Color Validation
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
BGreen='\e[1;32m'
BYellow='\e[1;33m'
BBlue='\e[1;34m'
BPurple='\e[1;35m'
BCyan='\e[1;36m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
# VPS Information
#Domain
domain=$(cat /etc/xray/domain)
#Status certificate
modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
modifyTime1=$(date +%s -d "${modifyTime}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
tlsStatus=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	tlsStatus="expired"
fi
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
# user
Exp2=$"Lifetime"
Name=$"KOCHENG VPN"
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
#ISP=$(curl -s ipinfo.io/org?token=ce3da57536810d | cut -d " " -f 2-10 )
#CITY=$(curl -s ipinfo.io/city?token=ce3da57536810d )
#WKT=$(curl -s ipinfo.io/timezone?token=ce3da57536810d )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ifconfig.me )
LOC=$(curl -s ifconfig.co/country )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )

#####################################
# // Author   : LT
# // Telegram : @LunaticTunnel
# // Whatsapp : 6285955333616
# // Chanell  : @LTTestimoniqu

#####################################

# // color validity
# // color format 38
runn='\e[38;5;14m' 
acc='\e[38;5;146m'
LO='\e[38;5;162m'
UK='\e[38;5;99m'  # UNGU KOLOT
BK='\e[38;5;196m' # BEREM KOLOT 
R1='\e[38;5;155m' # HEJO SEMU BODAS
R2='\e[38;5;49m'  # HEJO LIME / APEL
BC='\e[38;5;195m' # BODAS CERAH PISAN
HU='\e[38;5;115m' # HEJO SEMU ABU
UB='\e[38;5;147m' # UNGU KABODASAN
KT='\e[38;5;187m' # KONENG TARIGU
Suffix='\e[0m'


function Banner_Kocheng() {
clear
echo -e "\e[38;5;99m┌─────────────────────────────────────────────────┐\033[0m "
echo -e "\e[38;5;99m│\e[44;37;1m                 KOCHENG TUNNELING              \033[0m \e[38;5;99m│\e[0m"
echo -e "\e[38;5;99m└─────────────────────────────────────────────────┘\033[0m "
}


function Information_Vps() {
echo -e "\e[38;5;99m┌─────────────────────────────────────────────────┐\033[0m "
echo -e "\e[38;5;99m│   \e[4;37;1mINFORMATION VPS\e[0m"
echo -e "\e[38;5;99m│\e[1;32m OS            \e[0m: "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`	
echo -e "\e[38;5;99m│\e[1;32m Uptime        \e[0m: $uptime"
echo -e "\e[38;5;99m│\e[1;32m Public IP     \e[0m: $IPVPS"
echo -e "\e[38;5;99m│\e[1;32m Country       \e[0m: $LOC"
echo -e "\e[38;5;99m│\e[1;32m DOMAIN        \e[0m: $domain"
echo -e "\e[38;5;99m│\e[1;32m RAM USED      \e[0m: $uram MB"
echo -e "\e[38;5;99m│\e[1;32m RAM TOTAL     \e[0m: $tram MB"
echo -e "\e[38;5;99m│\e[1;32m DATE & TIME   \e[0m: $DATE2"
echo -e "\e[38;5;99m└─────────────────────────────────────────────────┘\033[0m "
echo -e "\e[38;5;99m┌─────────────────────────────────────────────────┐\033[0m "
echo -e "\e[38;5;99m│  \e[4;37;1m INFORMATION BANDWITH\e[0m                          \e[38;5;99m│"
echo -e "\e[38;5;99m│\e[1;32m DOWNLOAD      \e[0m:  ${dmon}B                      \e[38;5;99m│"
echo -e "\e[38;5;99m│\e[1;32m UPLOAD        \e[0m:  ${dmon}B                      \e[38;5;99m│"
echo -e "\e[38;5;99m│\e[1;32m BW TOTAL      \e[0m:  ${dmon}B                      \e[38;5;99m│"
echo -e "\e[38;5;99m└─────────────────────────────────────────────────┘\033[0m "
}



function Menu_Display() {
echo -e "\e[38;5;99m┌─────────────────────────────────────────────────┐\033[0m "
echo -e "\e[38;5;99m│\e[44;97;1m                  LISTED  MENU                   \e[0m\e[38;5;99m│"
echo -e "\e[38;5;99m└─────────────────────────────────────────────────┘\033[0m "
echo -e "\e[38;5;99m┌─────────────────────────────────────────────────┐\033[0m "
echo -e "\e[38;5;99m│\e[1;36m 01. \e[37;1m SSH OPENVPN        \e[36;1m 07. \e[37;1mSERVICE STATUS     \e[38;5;99m│\e[0m "
echo -e "\e[38;5;99m│\e[1;36m 02. \e[37;1m VMESS XRAY         \e[36;1m 08. \e[37;1mRESTART SERVICE    \e[38;5;99m│\e[0m"
echo -e "\e[38;5;99m│\e[1;36m 03. \e[37;1m VLESS  XRAY        \e[36;1m 09. \e[37;1mPOINTING IP VPS    \e[38;5;99m│\e[0m"
echo -e "\e[38;5;99m│\e[1;36m 04. \e[37;1m TRJAN XRAY         \e[36;1m 10. \e[37;1mCHANGE DOMAIN      \e[38;5;99m│\e[0m"
echo -e "\e[38;5;99m│\e[1;36m 05. \e[37;1m SSR  - LIBEV       \e[36;1m 11. \e[37;1mFEATURES           \e[38;5;99m│\e[0m"
echo -e "\e[38;5;99m│\e[1;36m 06. \e[37;1m NOOBZVPNS          \e[31;1m  x. EXIT               \e[38;5;99m│\e[0m"
echo -e "\e[38;5;99m└─────────────────────────────────────────────────┘\033[0m "
}



function Expiry_Info() {
echo -e "\e[38;5;99m┌─────────────────────────────────────────────────┐\033[0m "
echo -e "\e[38;5;99m│ \e[1;33m Client on   : $Name \e[0m"
echo -e "\e[38;5;99m│ \e[1;33m Expiry in   : $Exp2 \e[0m"
echo -e "\e[38;5;99m└─────────────────────────────────────────────────┘\033[0m "
echo -e   ""
}


function Select_Display() {
read -p " Select From Options :  "  opt
case $opt in
1) clear ; m-sshovpn ;;
2) clear ; m-vmess ;;
3) clear ; m-vless ;;
4) clear ; m-trojan ;;
5) clear ; m-ssws ;;
6) clear ; m-noobz ;;
7) clear ; running ;;
8) clear ; restart ;;
9) clear ; pointing-domain ;;
10) clear ; change-domain ;;
11) clear ; m-system ;;
*) exit ;;
esac
}


Banner_Kocheng
Information_Vps
Menu_Display
Expiry_Info
Select_Display
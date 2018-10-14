#!/bin/sh
##
## First Configuration for Debian Server
## 
## Author: Benjamin LEBLOND <benjamin.leblond@orange.fr>
## nebjix.free.fr
## github.com/benjiLeblond08

if (( $EUID != 0 )); then
  echo "This must be run as root." 
  exit 1
fi

echo "$(tput bold ; tput setaf 6)Updating packages...$(tput sgr0)"
apt-get update -q -y
echo "$(tput bold ; tput setaf 6)Upgrading Dist...$(tput sgr0)"
apt-get dist-upgrade

echo "$(tput bold ; tput setaf 6)Installing Vim...$(tput sgr0)"
apt-get install vim -q -y
echo "$(tput bold ; tput setaf 6)Installing CURL...$(tput sgr0)"
apt-get install curl -q -y
echo "$(tput bold ; tput setaf 6)Installing Wget...$(tput sgr0)"
apt-get install wget -q -y
echo "$(tput bold ; tput setaf 6)Installing Git...$(tput sgr0)"
apt-get install git -q -y


# response=""
# read -r -p "$(tput bold ; tput setaf 2)Start root Shell? [Y/n] $(tput sgr0)" response
# if echo $response | grep -Eq '^[nN][oO]|^[nN]$'
# then
# 	su -
# fi
# if [[ "$response" -ne ^([nN][oO]|[nN])+$ ]]; then
# if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]; then

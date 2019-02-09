#!/bin/bash
# 
# Install and configure Oh-My-ZSH
# 
# Author: Benjamin LEBLOND <benjamin.leblond@orange.fr>

if [[ $EUID -eq 0 ]]; then
	echo "You must NOT run this script as ROOT" 2>&1
	exit 1
fi

read -r -p "Update packages list (apt-get update)? [y/N] " confirmation
if [ "$confirmation" != y ] && [ "$confirmation" != Y ]; then
	sudo apt-get update -q -y
fi

echo "$(tput bold ; tput setaf 6)Installing ZSH...$(tput sgr0)"
sudo apt-get install zsh -q -y
echo "$(tput bold ; tput setaf 6)Installing Oh-My-ZSH...$(tput sgr0)"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed -e '/env zsh -l/s/^/#/g')"
echo "$(tput bold ; tput setaf 6)Installing Screenfetch...$(tput sgr0)"
sudo apt-get install screenfetch -q -y
echo "$(tput bold ; tput setaf 6)Configuring Oh-My-ZSH...$(tput sgr0)"
wget https://raw.githubusercontent.com/BenjiLeblond08/dotfiles/master/nebjix.zsh-theme
mv nebjix.zsh-theme ~/.oh-my-zsh/custom/themes/
sed -i 's/^ZSH_THEME=.*$/ZSH_THEME="nebjix"/' ~/.zshrc
sed -i '/alias /s/^#//g' ~/.zshrc
echo "" >> ~/.zshrc
echo "# Custom command" >> ~/.zshrc
echo "clear" >> ~/.zshrc
echo "screenfetch" >> ~/.zshrc
echo "$(tput bold ; tput setaf 6)Configuration Done$(tput sgr0)"
env zsh -l

#!/bin/sh
##
## Install and configure Oh-My-ZSH
## 
## Author: Benjamin LEBLOND <benjamin.leblond@orange.fr>
## nebjix.free.fr
## github.com/benjiLeblond08

echo "$(tput bold ; tput setaf 6)Installing ZSH...$(tput sgr0)"
apt-get install zsh -q -y
echo "$(tput bold ; tput setaf 6)Installing Oh-My-ZSH...$(tput sgr0)"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "$(tput bold ; tput setaf 6)Installing Screenfetch...$(tput sgr0)"
apt-get install screenfetch -q -y
echo "$(tput bold ; tput setaf 6)Configuring Oh-My-ZSH...$(tput sgr0)"
wget https://raw.githubusercontent.com/BenjiLeblond08/debian-server/master/nebjix.zsh-theme
mv nebjix.zsh-theme ~/.oh-my-zsh/custom/themes/
sed -i 's/^ZSH_THEME=.*$/ZSH_THEME="nebjix"/' ~/.zshrc
echo clear >> ~/.zshrc
echo screenfetch >> ~/.zshrc
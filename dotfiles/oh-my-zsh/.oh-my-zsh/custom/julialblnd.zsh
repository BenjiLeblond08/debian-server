export PATH=$HOME/bin:/usr/local/bin:$PATH
ZSH_THEME="nebjix"
plugins=(git)

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR=vim
else
  export EDITOR=vim
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

if [[ "$(pwd)" == "/mnt/c/Windows/System32" ]]; then
	cd ${HOME}
	clear
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias ls='ls -h --color=auto'
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias bye="cd && exit && exit"
alias back='cd $OLDPWD'
alias e="explorer.exe"
alias e.="explorer.exe ."
alias tracert='tracert.exe'
alias subl="/mnt/c/Program\ Files/Sublime\ Text\ 3/sublime_text.exe"
alias st="subl"
alias go='go.exe'

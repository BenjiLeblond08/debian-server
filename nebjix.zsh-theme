# local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
# PROMPT='${ret_status}%{$reset_color%} $fg_bold[green]%}%n%{$reset_color%}@$fg[green]%}%m%{$reset_color%}:%{$fg_bold[cyan]%}%~%{$reset_color%} $(git_prompt_info)'
# # PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
# 
# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# meh. Dark Blood Rewind, a new beginning.

PROMPT=$'%{$fg[red]%}┌[%{$fg_bold[white]%}%n%{$reset_color%}%{$fg[red]%}@%{$fg_bold[white]%}%m%{$reset_color%}%{$fg[red]%}:%{$fg_bold[white]%}%~%{$reset_color%}%{$fg[red]%}] [%{$reset_color%}%*%{$fg[red]%}] %{$(git_prompt_info)%}%(?,,%{$fg[red]%}[%{$fg_bold[white]%}%?%{$reset_color%}%{$fg[red]%}])
%{$fg[red]%}└>%{$reset_color%} '
PS2=$' %{$fg[red]%}|>%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}[%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[red]%}] "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$reset_color%}"

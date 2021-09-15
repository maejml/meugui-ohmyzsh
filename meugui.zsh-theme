# oh my zsh theme by @maejml

#Regular text color
BLACK='\[\e[0;30m\]'
#Bold text color
BBLACK='\[\e[1;30m\]'
#Background color
BGBLACK='\e[40m'
RED='\e[0;31m'
BRED='\e[1;31m'
BGRED='\e[41m'
GREEN='\e[0;32m'
BGREEN='\e[1;32m'
BGGREEN='\e[1;32m'
YELLOW='\e[0;33m'
BYELLOW='\e[1;33m'
BGYELLOW='\e[1;33m'
BLUE='\e[0;34m'
BBLUE='\e[1;34m'
BGBLUE='\e[1;34m'
MAGENTA='\e[0;35m'
BMAGENTA='\e[1;35m'
BGMAGENTA='\e[1;35m'
CYAN='\e[0;36m'
BCYAN='\e[1;36m'
BGCYAN='\e[1;36m'
WHITE='\e[0;37m'
BWHITE='\e[1;37m'
BGWHITE='\e[1;37m'

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} +"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✱"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[blue]%} ✈"
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}"

starttop() {
  echo "%{$BBLUE%}┌─[%f"
}
startbottom() {
  echo "%{$BBLUE%}└─[%f"
}

lb() {
  echo "%B%{$BBLUE%}[%f%b"
}
rb() {
  echo "%B%{$BBLUE%}]%f%b"
}

user() {
  echo "%{$BYELLOW%}%n%f@%{$CYAN%}%m%f"
}

directory() {
  echo "$(lb)%{$BWHITE%}%2~%f$(rb)"
}

status() {
  echo "%(?.%{$MAGENTA%}$%f.%{$RED%}✘%f)"
}

rightstatus() {
  echo "%(?.✔.%{$RED%}✘%f)"
}

mygit() {
  if [[ "$(git config --get oh-my-zsh.hide-status)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
    echo " - $(lb)${ref#refs/heads/}$( git_prompt_status )$(rb)"
  fi
}

PROMPT=$'$(starttop)$(user)$(rb) - $(directory)$(mygit)$(hg_prompt_info)
$(startbottom)$(status)$(rb) '
RPROMPT="$(rightstatus) [%*]"
. ~/.bash_aliases
. ~/.bash_functions

[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

if [[ ! -d "$HOME/bin" ]]; then
  mkdir "$HOME/bin"
fi

add_to_path "$HOME/bin" top

# Colors
if [[ $TERM = *color* ]]; then
  PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='\u:\w\$ '
fi

case "$TERM" in
  xterm*|rxvt*) PS1="\[\e]0;\u: \w\a\]$PS1" ;;
             *) ;;
esac

if [[ -x /usr/bin/dircolors ]]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [[ is_wsl2 ]]; then
  echo "Running on WSL2"
  
  export DOCKER_BUILDKIT=0
  export COMPOSE_DOCKER_CLI_BUILD=0

  alias cdwin="cd $(get_windows_home)"
fi

HISTSIZE=9999
HISTFILESIZE=9999
HISTCONTROL=ignoreboth
HISTTIMEFORMAT='%F %T '

shopt -s histappend
shopt -s checkwinsize

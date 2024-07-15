. ~/.shellrc.d/.sharedrc

shopt -s histappend
PROMPT_COMMAND='history -a'

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1='\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]\$ '

if which zoxide &>/dev/null; then
  eval "$(zoxide init bash)"
fi

if [[ -f /usr/local/opt/asdf/libexec/asdf.sh ]]; then
  . /usr/local/opt/asdf/libexec/asdf.sh
fi

if [[ -f /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash ]]; then
  . /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
fi


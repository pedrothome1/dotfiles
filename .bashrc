. ~/.shellrc.d/.sharedrc

HISTSIZE=9999
HISTCONTROL='erasedups'
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

if which direnv &>/dev/null; then
  eval "$(direnv hook bash)"
fi

if which mise &>/dev/null; then
  eval "$(mise activate bash)"
fi

if [[ "$OS_NAME" == "Darwin" ]]; then
  if [[ -f "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh" ]]; then
    . "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh"
  fi

  if [[ -f "$HOMEBREW_PREFIX/opt/asdf/etc/bash_completion.d/asdf.bash" ]]; then
    . "$HOMEBREW_PREFIX/opt/asdf/etc/bash_completion.d/asdf.bash"
  fi
fi


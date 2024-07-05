. ~/.shellrc.d/.sharedrc

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(asdf)

# Enable built-ins provided by GNU
enable_builtins() {
  enable kill
  enable false
  enable true
  enable echo
  enable test
  enable [
  enable pwd
  enable printf
}

# Disable built-ins provided by GNU
disable_builtins() {
  disable kill
  disable false
  disable true
  disable echo
  disable test
  disable [
  disable pwd
  disable printf
}

if [[ "$DARWIN_USING_GNU" == 'true' ]]; then
  if [[ -f $ZSH/oh-my-zsh.sh ]]; then
    autoload -Uz add-zsh-hook

    # Run enable_builtins before the prompt is shown
    # So that Oh My Zsh async git hooks can use them
    # This is to avoid errors such as:
    # _omz_async_request:39: no such builtin: echo
    add-zsh-hook precmd enable_builtins

    . $ZSH/oh-my-zsh.sh

    # Run disable_builtins after `precmd` hooks of Oh My Zsh
    # We're disabling builtins to use the GNU utilities instead
    add-zsh-hook precmd disable_builtins
  fi

  disable_builtins
elif [[ -f $ZSH/oh-my-zsh.sh ]]; then
  . $ZSH/oh-my-zsh.sh
fi

setopt KSH_ARRAYS


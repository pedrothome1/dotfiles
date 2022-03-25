# Utilities
add_to_path() {
  local dir="${1%/}"
  local boundary="${2:-bottom}"

  test -d "$dir" || return 0
  echo ":$PATH:" | grep -q ":$dir:" && return 0

  case "$boundary" in
    top   ) PATH="$dir:$PATH" ;;
    bottom) PATH="$PATH:$dir" ;;
  esac
}

b0() {
  cd ~
  . .bashrc
  cd - 1> /dev/null
}

is_wsl2() {
  $(uname -r | grep -iq wsl2) || -n "$WSL_DISTRO_NAME"
}

get_windows_home() {
  local user=""

  for i in /mnt/c/Users/*; do
    user=${i#/mnt/c/Users/}
    case "$user" in *pedro*) break ;; *) continue ;; esac
  done

  if [[ -n "$user" ]]; then
    echo -n "/mnt/c/Users/$user"
  fi
}

# Vim Shortcuts
vimainc() {
  local filename="${1:-main.c}"

  if [[ ! -f $filename ]]; then
    echo -ne \
"#include <stdio.h>\n\n"\
"int main(int argc, char *argv[]) {\n"\
"  \n"\
"}\n\n" > "$filename"
  fi
  
  vim "$filename"
}

vimain() {
  local filename="${1:-main.cpp}"
  
  if [[ ! -f $filename ]]; then
    echo -ne \
"#include <iostream>\n\n"\
"using namespace std;\n\n"\
"int main(int argc, char *argv[]) {\n"\
"  \n"\
"}\n\n" > "$filename"
  fi

  vim "$filename"
}

vimsh() {
  local filename="${1:-test.sh}"

  if [[ ! -f $filename ]]; then
    echo -ne "#!/bin/bash\n\n" > "$filename"
    chmod u+x "$filename"
  fi

  vim "$filename"
}

vimpy() {
  local filename="${1:-main.py}"
  
  if [[ ! -f $filename ]]; then
    echo -ne \
"#!/usr/bin/env python3\n\n"\
"def main():\n"\
"  pass\n\n"\
"if __name__ == \"__main__\":\n"\
"  main()\n\n" > "$filename"

    chmod u+x "$filename"
  fi

  vim "$filename"
}

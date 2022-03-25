add_to_path() {
  local dir="${1%/}"
  local boundary="${2:-bottom}"

  test -d "$dir" || return 0

  case "$boundary" in
    top   ) PATH="$dir:$PATH" ;;
    bottom) PATH="$PATH:$dir" ;;
  esac
}

b0() {
  cd ~
  source .bashrc
  cd - 1> /dev/null
}

vimainc() {
	local filename="${1:-main.c}"

  echo -ne \
"#include <stdio.h>\n\n"\
"int main(int argc, char *argv[]) {\n"\
"  \n"\
"}\n\n" > "$filename"
	
  vim "$filename"
}

vimain() {
	local filename="${1:-main.cpp}"
	
    echo -ne \
"#include <iostream>\n\n"\
"using namespace std;\n\n"\
"int main(int argc, char *argv[]) {\n"\
"  \n"\
"}\n\n" > "$filename"

	vim "$filename"
}

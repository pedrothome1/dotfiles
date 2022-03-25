vimainc() {
	if [[ "$#" -ne 1 ]]; then
		filename="main.c"
	else
		filename=$1
	fi

	echo -ne '#include <stdio.h>\n\nint main(int argc, char *argv[]) {\n  \n}\n\n' > "$filename"
	vim "$filename"
}

vimain() {
	if [[ "$#" -ne 1 ]]; then
		filename="main.cpp"
	else
		filename=$1
	fi

	echo -ne '#include <iostream>\n\nint main(int argc, char *argv[]) {\n  \n}\n\n' > "$filename"
	vim "$filename"
}


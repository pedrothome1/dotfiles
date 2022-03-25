function! InitIndent(spaces)
  if a:spaces
    set expandtab
  else
    set noexpandtab
  endif

  set smartindent
  set autoindent
endfunction

function! SetIndentSize(size)
  let &tabstop=a:size
  let &softtabstop=a:size
  let &shiftwidth=a:size
endfunction

call InitIndent(1)
call SetIndentSize(2)

set nu
set nobackup


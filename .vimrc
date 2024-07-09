" General settings
set nu
set nocompatible
set nobackup
set writebackup
set encoding=utf-8
set timeoutlen=1000
set ttimeoutlen=0

" Global indentation settings
set expandtab
set smartindent
set autoindent
set tabstop=2
set softtabstop=-1 " use shiftwidth value
set shiftwidth=2

" Go settings
augroup go_settings
  autocmd!
  autocmd FileType go setlocal noexpandtab
  autocmd FileType go setlocal tabstop=4
  autocmd FileType go setlocal shiftwidth=4
  autocmd FileType go setlocal foldmethod=syntax " vim-go uses this
augroup END 

" Vim settings
augroup vim_settings
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END

" Syntax highlighting
syntax on
colorscheme sorbet
set termguicolors

" Common typos on commands
cabbrev W w
cabbrev Q q
cabbrev Qa qa
cabbrev QA qa
cabbrev X x
cabbrev Wq wq
cabbrev WQ wq
cabbrev Bd bd
cabbrev BD bd

" Setup leader key
let mapleader = ' '
vnoremap <leader> <Nop>
nnoremap <leader> <Nop>

" Tabs and Windows
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap { gT
nnoremap } gt
tnoremap û <C-w>NgT
tnoremap ý <C-w>Ngt

" Copy & Paste
vnoremap <C-c> "+ygvy
inoremap <C-v> <Esc>"+pa
inoremap <C-p> <Esc>pa

" Forbid arrow keys usage
noremap <Right> <Nop>
noremap <Left> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
inoremap <Right> <Nop>
inoremap <Left> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>

" Folding
noremap + :foldopen!<Esc>
noremap _ :foldclose<Esc>
set foldlevelstart=99

" Movements in Normal, Visual, Select and Operator-pending modes
noremap J }
noremap K {
noremap H ^
noremap L $

" Move selected lines in Visual mode
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv

" vim-plug
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vader.vim'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" nerdtree
nnoremap <leader>e :NERDTreeToggle<CR>

" fzf
nnoremap <leader>o :Files<CR>
let g:fzf_action = { 'enter': 'tab split' }

" vim-go
let g:go_doc_keywordprg_enabled = 0           " disable K mapping to show docs
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1

def! FormatFiles()
  var files = ""

  redir => files
  silent GoFiles
  redir END

  new
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile

  files = trim(files, "\n []")
  var line = 1

  for file in split(files, ',')
    setline(line, trim(file, " '"))
    line += 1
  endfor

  setlocal nomodifiable
enddef


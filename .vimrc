" General settings
set nu
set nocompatible
set nobackup
set writebackup
set encoding=utf-8

" Global indentation settings
set expandtab
set smartindent
set autoindent
set tabstop=2
set softtabstop=-1 " use shiftwidth value
set shiftwidth=2

" Go indentation settings
augroup go_settings
  autocmd!
  autocmd FileType go setlocal noexpandtab
  autocmd FileType go setlocal tabstop=4
  autocmd FileType go setlocal shiftwidth=4
  autocmd FileType go setlocal foldmethod=syntax " vim-go uses this
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

" Folding
noremap + :foldopen!<Esc>
noremap _ :foldclose<Esc>
set foldlevelstart=99

" Movements in Normal, Visual, Select and Operator-pending modes
noremap J }
noremap K {
noremap q b
noremap Q B
noremap s ^
noremap f $
noremap S 0
noremap F $
noremap w e
noremap W E

" Move selected lines in Visual mode
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv

" vim-plug
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'junegunn/vader.vim'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" nerdtree
nnoremap <leader>e :NERDTreeToggle<CR>

" vim-multiple-cursors
noremap <C-g> <Nop>
noremap <S-C-n> <Nop>
noremap <C-n> <nop>
noremap <C-N> <Nop>

let g:multi_cursor_start_word_key      = '<C-g>'
let g:multi_cursor_next_key            = '<C-g>'
let g:multi_cursor_select_all_word_key = '<C-n>'

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


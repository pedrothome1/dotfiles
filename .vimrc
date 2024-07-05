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
set softtabstop=2
set shiftwidth=2

" Syntax highlighting
syntax on
colorscheme sorbet
set termguicolors

" Common typos on commands
cabbrev W w
cabbrev Q q
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
nnoremap { gT
nnoremap } gt

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

" Add lines above and below without entering Insert mode
nnoremap <C-j> o<Esc>
nnoremap <C-k> O<Esc>

" vim-plug
call plug#begin()
  Plug 'sheerun/vim-polyglot'
  Plug 'morhetz/gruvbox'
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'keiyakeiya/PapilioDehaanii.vim'
  Plug 'terryma/vim-multiple-cursors'
call plug#end()

" nerdtree
nnoremap <leader>e :NERDTreeToggle<CR>

" vim-multiple-cursors
noremap <C-g> <Nop>
noremap <S-C-n> <Nop>
noremap <C-n> <nop>
noremap <C-N> <Nop>
noremap N <Nop>
let g:multi_cursor_start_word_key      = '<C-g>'
let g:multi_cursor_next_key            = '<C-g>'
let g:multi_cursor_select_all_word_key = '<C-n>'

" fzf
nnoremap <leader>o :Files<CR>
let g:fzf_action = { 'enter': 'tab split' }


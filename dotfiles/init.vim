call plug#begin('~/.config/nvim/plugged')

	Plug 'morhetz/gruvbox'
	Plug 'mhinz/vim-startify'
	Plug 'sickill/vim-monokai'
	Plug 'scrooloose/nerdtree'
	Plug 'joshdick/onedark.vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'vim-airline/vim-airline'

let g:startify_custom_header = [
 \' ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
 \' ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
 \' ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
 \' ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
 \' ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
 \' ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
 \ ]                                                 

call plug#end()

nnoremap <C-n> :NERDTreeToggle<CR>

syntax on
set termguicolors

set tabstop=4
set encoding=utf-8
set shiftwidth=4

set title
set number
set hlsearch
set incsearch
set showmatch
set autoindent
set noswapfile

colorscheme onedark

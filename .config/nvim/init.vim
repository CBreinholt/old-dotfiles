let mapleader =","

if ! filereadable(expand('$HOME/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p "$HOME/.config/nvim/autoload/"
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Plugin list:
call plug#begin('~/.config/nvim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
"Plug 'vim-airline/vim-airline'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'
Plug 'itchyny/lightline.vim'
call plug#end()

" Some basics:
	set go=a
	set mouse=a
	set hlsearch
	set clipboard+=unnamedplus
	set t_Co=256
	set notermguicolors
	set encoding=utf-8
	set number relativenumber
	set noshowmode
	set nocompatible
	set tabstop=4
	set shiftwidth=4
	set expandtab
	filetype plugin on
	syntax on

" Enable autocompletion:
	set wildmode=longest,list,full

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set linebreak<CR>
	let g:limelight_conceal_ctermfg = 240
	let g:limelight_default_coefficient = 0.7
	"autocmd! User GoyoEnter Limelight
	"autocmd! User GoyoLeave Limelight!

" Spell-check set to <leader>o, 'o' for 'orthography':
	"map <leader>o :setlocal spell! spelllang=en_us<CR>

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
	highlight! link DiffText MatchParen
endif

" Colorscheme options:
    let g:lightline = { 'colorscheme': 'nord' }
	let g:nord_uniform_status_lines = 1
	let g:nord_cursor_line_number_background = 1
	let g:nord_bold = 1
	let g:nord_italic = 1
	let g:nord_italic_comments = 1
	let g:nord_underline = 1
	colorscheme nord

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
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'itchyny/lightline.vim'

" These plugins are mainly for writting papers
Plug 'ron89/thesaurus_query.vim'
Plug 'rhysd/vim-grammarous'
Plug 'dbmrq/vim-ditto'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'lervag/vimtex'
call plug#end()

" Some basics:
	set go=a
	set mouse=a
	set clipboard+=unnamedplus
	set t_Co=256
	set notermguicolors
	set encoding=utf-8
	set nocompatible
	set number relativenumber
	set hlsearch
    set incsearch
	set noshowmode
	set tabstop=4
	set shiftwidth=4
	set expandtab
	filetype plugin on
	syntax on
    set dir=$HOME/.vim/swapfiles//,.,~/tmp,/var/tmp,/tmp

" Enable autocompletion:
	set wildmode=longest,list,full

" Split behavior
    set splitbelow splitright
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Zen mode
	map <leader>f :Goyo \| set linebreak<CR>
	let g:limelight_conceal_ctermfg = 240
	let g:limelight_default_coefficient = 0.7
	autocmd! User GoyoEnter Limelight
	autocmd! User GoyoLeave Limelight!

" Spell-check
    map <leader>o :setlocal spell! spelllang=en_us<CR>

" Grammar-check
    map <leader>g :GrammarousCheck \| set linebreak<CR>
    map <leader><S-g> :GrammarousReset \| set linebreak<CR>
    let g:grammarous#default_comments_only_filetypes = { '*':1, 'markdown':0, 'text':0 }
    let g:grammarous#hooks = {}
    function! g:grammarous#hooks.on_check(errs) abort
        nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
        nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
        nmap <buffer><C-i> <Plug>(grammarous-open-info-window)
    endfunction
    function! g:grammarous#hooks.on_reset(errs) abort
        nunmap <buffer><C-n>
        nunmap <buffer><C-p>
        nunmap <buffer><C-i>
    endfunction

" Check for over usage of words within the file
    au FileType markdown,test DittoOn
    nmap <leader>di <Plug>ToggleDitto
    nmap <leader>ds :DittoSentOn \| set linebreak<CR>
    nmap <leader>dp :DittoParOn \| set linebreak<CR>
    nmap <leader>df :DittoFileOn \| set linebreak<CR>

" Pandoc
    let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
    let g:pandoc#filetypes#pandoc_markdown = 0
    let g:pandoc#modules#disabled = ["folding","formatting"]
    "let g:pandoc#command#autoexec_command = Pandoc! pdf --pdf-engine=xelatex
    let g:pandoc#command#prefer_pdf = 1
    "let g:pandoc#command#autoexec_on_writes = 1
    let g:pandoc#command#use_message_buffers = 0

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

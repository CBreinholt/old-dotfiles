let mapleader =","

if ! filereadable(expand('$HOME/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p "$HOME/.config/nvim/autoload/"
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

"#######################################################
" Polyglot vim configuration
"#######################################################
"let g:polyglot_disabled=['markdown']
"#######################################################
" Apparently this needs to come before the plugin itself
"#######################################################

" Plugin list:
call plug#begin('~/.config/nvim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'rhysd/vim-grammarous'
Plug 'jlanzarotta/bufexplorer'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
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
set nohlsearch
set incsearch
set noshowmode
set tabstop=4
set shiftwidth=4
set expandtab
set noshowmode
set updatetime=100
filetype plugin on
syntax on

" Enable autocompletion:
set wildmode=longest,list,full

" Split behavior
set splitright splitbelow
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Automatically deletes all trailing whitespace on save.
let g:ale_fix_on_save = 1
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}

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

" Zen more
map <leader>f :Goyo \| set linebreak<CR>
let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient = 0.7
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Airline
let g:airline_theme="nord"
let g:airline_powerline_fonts=1
let g:airline_detect_iminsert=1
let g:airline_inactive_collapse=0
let g:airline_skip_empty_sections=1
let g:airline_detect_paste=1
let g:airline_detect_modified=1
let g:airline_highlighting_cache=1
let g:airline_focuslost_inactive=0
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 0
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
let g:airline#extensions#ale#enabled=1
let g:airline#extensions#wordcount#filetypes = ['text']
let g:airline#extensions#tabline#enabled = 1

"set laststatus=2
"let g:lightline = {
      "\ 'colorscheme': 'onedark',
      "\ 'active': {
      "\   'left': [ [ 'mode', 'paste' ], [ 'filename' ], [ 'bufferline' ] ],
      "\ },
      "\ 'component': {
      "\   'readonly': '%{&readonly?"":""}',
      "\'bufferline': '%{bufferline#refresh_status()}%{g:bufferline_status_info.before . g:bufferline_status_info.current . g:bufferline_status_info.after}',
      "\ },
      "\ 'separator':    { 'left': '', 'right': '' },
      "\ 'subseparator': { 'left': '', 'right': '' },
"\ }

" Colorscheme options:
let g:lightline = { 'colorscheme': 'nord' }
let g:nord_uniform_status_lines = 1
let g:nord_cursor_line_number_background = 1
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
colorscheme nord

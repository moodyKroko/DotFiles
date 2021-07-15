" _       _ _           _
"(_)_ __ (_) |_  __   _(_)_ __ ___
"| | '_ `' | __| \ \ / / | '_ ` _ \
"| | | | | | |_  _\ v /| | | | | | |
"|_|_| |_|_|___|(_)\_/ |_|_| |_| |_|

" Basic "{{{
" ---------------------------------------------------------------------
set nocompatible
let mapleader=" "
filetype off

set encoding=utf-8
set number relativenumber
set ruler

set clipboard+=unnamedplus
set cmdheight=1
set hidden
set laststatus=2
set lazyredraw
set mouse=a
set scrolloff=10
set signcolumn=number     " merge gutter and num >0.5.0
set showcmd
set noshowmode
set shortmess+=c
set updatetime=50
set nobackup
set noswapfile

" search
set ignorecase
set incsearch
set smartcase
set showmatch

" indents
filetype plugin indent on
set shiftwidth=4
set tabstop=4
set expandtab
"set softtabstop=4
set autoindent
set smarttab
set smartindent
set nowrap

" set undo directory
set undodir=~/.Local/share/nvim/undo
set undofile

" Enable autocompletion:
set completeopt=menuone,noinsert,noselect

" Splits open at the bottom and right, unlike vim defaults
set nosplitbelow

"}}}

" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline
set colorcolumn=80
set nohlsearch

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

"}}}

" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim

runtime ./maps.vim
"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------
if (has("termguicolors"))
    "syntax enable           "not with onedark colorscheme
    syntax on
    set termguicolors
    set wildoptions=pum

    "One dark
    "let g:onedark_hide_endofbuffer = 1
    "let g:onedark_terminal_italics = 1

    " onedark.vim override: Don't set a background color when running in a terminal;
    " just use the terminal's background color
    " `gui` is the hex color code used in GUI mode/nvim true-color mode
    " `cterm` is the color code used in 256-color mode
    " `cterm16` is the color code used in 16-color mode
    "if (has("autocmd") && !has("gui_running"))
    "  augroup colorset
    "    autocmd!
    "    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    "    " Make `Function`s bold in GUI mode
    "    autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })

    "    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
    "    " `bg` will not be styled since there is no `bg` setting
    "  augroup END
    "endif

    "colorscheme onedark

    " gruvbox
    let g:gruvbox_contrast_dark='hard'
    colorscheme gruvbox

    highlight ColorColumn ctermbg=0 guibg=grey
    hi SignColumn guibg=none
    hi CursorLineNR guibg=None
    highlight Normal guibg=none         " use terminal bg
    highlight LineNr guifg=#5eacd3      " gutter fg
    highlight netrwDir guifg=#5eacd3
    highlight qfFileName guifg=#aed75f
endif

"}}}

" Basic autocommands "{{{
" -----------------------------------------------------------------------------

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" Update a buffer's contents on focus if it changed outside of Vim.
au FocusGained,BufEnter * :checktime

"}}}

" Python config
let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/bin/python3'

" Plugin settings "{{{
" -----------------------------------------------------------------------------
    " frazrepo/vim-rainbow "{{{
    " -------------------------------------------------------------------------
        " rainbow color bracket setting
        let g:rainbow_active = 1
    "}}}

    " get correct comment highlighting "{{{
    " -------------------------------------------------------------------------
        autocmd FileType json syntax match Comment +\/\/.\+$+
    " }}}

"}}}

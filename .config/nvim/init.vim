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
        syntax on
        set termguicolors
        set wildoptions=pum

        let g:gruvbox_contrast_dark='hard'
        let g:gruvbox_italic=1
        colorscheme gruvbox

        hi ColorColumn ctermbg=0 guibg=grey
        hi SignColumn guibg=none
        hi CursorLineNR guibg=None
        hi Normal guibg=none         " use terminal bg
        hi LineNr guifg=#5eacd3      " gutter fg
        hi netrwDir guifg=#5eacd3
        hi qfFileName guifg=#aed75f
    endif
"}}}


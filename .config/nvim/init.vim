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

set encoding=utf8
set number relativenumber
set ruler

" test
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
    set background=dark

    "One dark
    "let g:onedark_hide_endofbuffer = 1
    let g:onedark_terminal_italics = 1
    " onedark.vim override: Don't set a background color when running in a terminal;
    " just use the terminal's background color
    " `gui` is the hex color code used in GUI mode/nvim true-color mode
    " `cterm` is the color code used in 256-color mode
    " `cterm16` is the color code used in 16-color mode
    if (has("autocmd") && !has("gui_running"))
      augroup colorset
        autocmd!
        let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
        autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
      augroup END
    endif
    colorscheme onedark

    " NeoSolarized
    "let g:neosolarized_termtrans = 1
    "colorscheme NeoSolarized

    " gruvbox
    "let g:gruvbox_contrast_dark='hard'
    "colorscheme gruvbox
endif

"}}}

" Basic autocommands "{{{
" -----------------------------------------------------------------------------

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" Update a buffer's contents on focus if it changed outside of Vim.
au FocusGained,BufEnter * :checktime

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"}}}

" Python config
let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/bin/python3'

" Plugin settings "{{{
" -----------------------------------------------------------------------------

    " scrooloose/nerdtree "{{{
    " -------------------------------------------------------------------------

        " nerdTree devi-cons highlighter
        let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
        let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

        " disable highlighting
        let g:NERDTreeDisableFileExtensionHighlight = 1
        let g:NERDTreeDisableExactMatchHighlight = 1
        let g:NERDTreeDisablePatternMatchHighlight = 1

        let g:NERDTreeLimitedSyntax = 1

        let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting;exact match
        let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name


        " Trigger a highlight in the appropriate direction when pressing these keys.
        let g:qs_highlight_on_keys=['f', 'F', 't', 'T']

        " Only underline the highlights instead of using custom colors.
        highlight QuickScopePrimary gui=underline cterm=underline
        highlight QuickScopeSecondary gui=underline cterm=underline
    "}}}

    " frazrepo/vim-rainbow "{{{
    " -------------------------------------------------------------------------

        " rainbow color bracket setting
        let g:rainbow_active = 1
    "}}}

    " junegunn/fzf.vim "{{{
    " -------------------------------------------------------------------------

        let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
        let $FZF_DEFAULT_OPTS = '--reverse'

        let g:fzf_action = {
          \ 'ctrl-t': 'tab split',
          \ 'ctrl-x': 'split',
          \ 'ctrl-v': 'vsplit',
          \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

        let g:fzf_colors =
        \ { 'fg':      ['fg', 'Normal'],
          \ 'bg':      ['bg', 'Normal'],
          \ 'hl':      ['fg', 'Comment'],
          \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
          \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
          \ 'hl+':     ['fg', 'Statement'],
          \ 'info':    ['fg', 'PreProc'],
          \ 'border':  ['fg', 'Ignore'],
          \ 'prompt':  ['fg', 'Conditional'],
          \ 'pointer': ['fg', 'Exception'],
          \ 'marker':  ['fg', 'Keyword'],
          \ 'spinner': ['fg', 'Label'],
          \ 'header':  ['fg', 'Comment'] }
    "}}}

    " itchyny/lightline.vim "{{{
    " -------------------------------------------------------------------------
    let g:lightline = {
          \ 'colorscheme': 'one',
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
          \ },
          \ 'component_function': {
          \   'gitbranch': 'FugitiveHead'
          \ },
          \ }
    "
"}}}

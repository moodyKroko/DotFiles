if has("nvim")
	let g:plug_home = stdpath('data') . 'plugged'
endif

call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kevinoid/vim-jsonc'
Plug 'mhinz/vim-startify'
Plug 'joshdick/onedark.vim'

if has("nvim")
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'gruvbox-community/gruvbox'
    Plug 'overcache/NeoSolarized'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

Plug 'ryanoasis/vim-devicons'   " should always be last

call plug#end()

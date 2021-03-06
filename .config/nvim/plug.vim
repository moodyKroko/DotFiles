if has("nvim")
	let g:plug_home = stdpath('data') . 'plugged'
endif

call plug#begin()
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'

if has("nvim")
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    "Plug 'mfussenegger/nvim-jdtls'
endif

Plug 'ryanoasis/vim-devicons'   " should always be last

call plug#end()

if !exists('g:loaded_nvim_treesitter')
	echom "Not Loaded treesitter"
	finish
endif

lua <<EOF
require 'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = false,
		disable = {},
	},
	ensure_installed = {
        "java",
        "json",
        "comment",
        "html",
        "css",
	}
}
EOF

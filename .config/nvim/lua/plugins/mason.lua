return {

  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },

    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "prettier",
      },
    },

    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")

      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
          border = "rounded",
        },
      })

      mason_lspconfig.setup({
        ensure_installed = {
          "tsserver",
          "html",
          "tailwindcss",
          "lua_ls",
          "emmet_ls",
          "pyright",
        },

        -- auto-install configured servers
        automatic_installation = true,
      })
    end,
  },
}

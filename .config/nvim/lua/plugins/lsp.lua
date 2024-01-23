return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "shellcheck",
        -- "luacheck",
        -- "tailwindcss-language-server",
        -- "typescript-language-server",
        "gopls",
        "goimports",
        "gofumpt",
        "delve",
        "gomodifytags",
        "impl",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.diagnostics = {
        virtual_text = false,
      }

      local util = require("lazyvim.util.lsp")
      util.on_attach(function(_, bufnr)
        vim.api.nvim_create_autocmd("CursorHold", {
          buffer = bufnr,
          callback = function()
            local diag_opts = {
              focusable = false,
              close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
              border = "rounded",
              source = "always",
              prefix = "● ",
              scope = "cursor",
            }

            vim.diagnostic.open_float(nil, diag_opts)
          end,
        })
      end)
    end,
  },
}

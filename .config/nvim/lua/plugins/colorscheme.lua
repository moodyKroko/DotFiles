return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "moon",
        dark_variant = "moon",

        disable_background = true,
        disable_float_background = true,

        groups = {
          background =  "pine",--"#133340", --"#255159",
          panel = "surface", -- "#133340",
          border = "pine",
        },

        highligt_groups = {
          ColorColumn = { bg = "foam", blend = 40 },

          -- blend colours against the 'base' background
          CursorLine = { bg = "pine", blend = 20 },

          -- Telescope settings
          -- TelescopeBorder = { fg = "pine", bg = "pine" },
          -- TelescopeNormal = { bg = "pine" },
        },
      })

      vim.cmd.colorscheme("rose-pine")

      -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },

}

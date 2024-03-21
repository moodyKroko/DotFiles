return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = false,
  },

  -- current color scheme
  {
    "rose-pine/neovim",
    lazy = false,
    name = "rose-pine",
    priority = 1000,
    config = function()
      return {
        require("rose-pine").setup({
          variant = "auto",
          dark_variant = "moon",
          dim_inactive_windows = false,
          extend_background_behind_borders = false,

          styles = {
            transparency = true,
          },

          groups = {
            border = "#f6c173", --"pine",
            -- background = "none",
          },

          highlight_groups = {
            ColorColumn = { bg = "highlight_low", blend = 40 },
            CursorLine = { bg = "highlight_med", blend = 90 },

            Search = { bg = "love", inherit = false },
            FloatBorder = { fg = "#f6c173", bg = "none" },
            LineNr = { fg = "#f6c173" }, -- gold

            -- nvim-cmp
            CmpPmenu = { bg = "none" }, --{ bg = "#011b26" },
            CmpSel = { bg = "highlight_high" },
            CmpDoc = { bg = "none" }, -- { bg = "#011b26" },

            -- Telescope
            TelescopeBorder = { fg = "#f6c173", bg = "none" },
            TelescopeNormal = { bg = "none" },
            TelescopePromptNormal = { bg = "none" },
            TelescopeResultsNormal = { fg = "subtle", bg = "none" },
            TelescopeSelection = { fg = "text", bg = "pine", blend = 40 },
            TelescopeSelectionCaret = { fg = "rose", bg = "none" },
          },
        }),

        vim.cmd("colorscheme rose-pine"),
      }
    end,
  },
}

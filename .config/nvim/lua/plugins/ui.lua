return {
  -- disabled UI packages
  { "indent-blankline.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },
  {
    "echasnovski/mini.indentscope",
    enabled = false,
  },

  -- status line
  {
    "nvim-lualine/lualine.nvim",
    -- enabled = false,
    opts = {
      options = {
        theme = "papercolor_light",
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
      },
    },
  },

  -- Notifications system
  {
    "rcarriga/nvim-notify",
    lazy = true,
    opts = {
      timeout = 3000,
      stages = "static",
      render = "default", -- "compact"
      background_colour = "#56B6C2", --#a9ff68
    },
  },

  -- rainbow brackets
  {
    "hiphish/rainbow-delimiters.nvim",
    event = "BufReadPre",
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          commonlisp = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },

  -- mason signs
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
        border = "rounded",
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      icons = {
        diagnostics = {
          Error = " ",
        },
      },
    },
  },

  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local logo = [[
███╗   ███╗ ██████╗  ██████╗ ██████╗ ██╗   ██╗██╗  ██╗██████╗  ██████╗ ██╗  ██╗ ██████╗ 
████╗ ████║██╔═══██╗██╔═══██╗██╔══██╗╚██╗ ██╔╝██║ ██╔╝██╔══██╗██╔═══██╗██║ ██╔╝██╔═══██╗
██╔████╔██║██║   ██║██║   ██║██║  ██║ ╚████╔╝ █████╔╝ ██████╔╝██║   ██║█████╔╝ ██║   ██║
██║╚██╔╝██║██║   ██║██║   ██║██║  ██║  ╚██╔╝  ██╔═██╗ ██╔══██╗██║   ██║██╔═██╗ ██║   ██║
██║ ╚═╝ ██║╚██████╔╝╚██████╔╝██████╔╝   ██║   ██║  ██╗██║  ██║╚██████╔╝██║  ██╗╚██████╔╝
╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ 
                                                                                        
      ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}

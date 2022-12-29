return {
  "folke/neodev.nvim",
  "folke/which-key.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",
  { "mg979/vim-visual-multi", event = "BufReadPost", branch = "master" },
  { "Pocco81/auto-save.nvim", event = "VeryLazy", config = true },

  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  -- Use treesitter to auto-close and auto-rename html tag
  { "windwp/nvim-ts-autotag", event = "InsertEnter", config = true },

  -- Persist sessions
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
  },

  -- Useful status updates for LSP
  { "j-hui/fidget.nvim", config = function()
    require("fidget").setup({
      text = {
        spinner = "line", -- animation shown when tasks are ongoing
        done = "✓", -- character shown when all tasks are complete
        commenced = "Started", -- message shown when task starts
        completed = "Completed", -- message shown when task completes
      },
    })
  end
  },

  { "stevearc/dressing.nvim", event = "VeryLazy" },

  { "andymass/vim-matchup", event = "BufRead", config = true },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup({
        plugins = {
          gitsigns = true,
          tmux = true,
        },
      })
    end,
  },
}

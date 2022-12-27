return {
  "sindrets/diffview.nvim",
  enable = true,
  cmd = "DiffviewOpen",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    require("diffview").setup {
      diff_binaries = false, -- Show diffs for binaries
      use_icons = true, -- Requires nvim-web-devicons
    }
  end,

  init = function()
    local wk = require("which-key")

    local binds = {
      g = {
        d = {
          name = "+diff",
          d = { "<cmd>DiffviewOpen<cr>", "Open" },
          o = { "<cmd>DiffviewOpen<cr>", "Open" },
          q = { "<cmd>DiffviewClose<cr>", "Close" },
          c = { "<cmd>DiffviewClose<cr>", "Close" },
          f = { "<cmd>DiffviewFocusFiles<cr>", "Focus Files" },
          t = { "<cmd>DiffviewToggleFiles<cr>", "Toggle Files" },
          r = { "<cmd>DiffviewRefresh<cr>", "Refresh" },
        }
      }
    }

    wk.register(binds, { prefix = "<leader>" })
  end,
}

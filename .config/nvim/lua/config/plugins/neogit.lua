return {
  "NeogitOrg/neogit",
  enabled = true,
  cmd = "Neogit",
  cond = not vim.g.vscode,

  dependencies = {
    { "nvim-lua/plenary.nvim" }
  },

  config = function()
    require("neogit").setup({
      kind = "vsplit",
      integrations = { diffview = true },
    })
  end,

  init = function()
    local wk = require("which-key")
    local binds = {
      g = {
        n = { "<cmd>Neogit<cr>", "Neogit" }
      }
    }

    wk.register(binds, { prefix = "<leader>" })
  end,
}

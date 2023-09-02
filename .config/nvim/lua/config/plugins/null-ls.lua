return {
  "jose-elias-alvarez/null-ls.nvim",
  enable = true,
  event = "BufReadPre",
  cond = not vim.g.vscode,

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions
    local completion = null_ls.builtins.completion

    null_ls.setup({
      debounce = 150,
      sources = {
        formatting.stylua,
        formatting.prettierd,
        code_actions.eslint_d,
        diagnostics.eslint_d,
        completion.spell,
      },
    })
  end
}

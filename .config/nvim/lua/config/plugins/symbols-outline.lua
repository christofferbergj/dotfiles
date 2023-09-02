return {
  "simrat39/symbols-outline.nvim",
  enabled = true,
  cond = not vim.g.vscode,

  keys = {
    { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" },
  },

  config = function()
    -- Configuration space
  end,

  init = function()
    -- Initialization space
  end,
}

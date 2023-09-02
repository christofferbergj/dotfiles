return {
  "folke/zen-mode.nvim",
  enabled = true,
  cmd = "ZenMode",
  cond = not vim.g.vscode,

  config = function()
    require("zen-mode").setup({
      plugins = {
        gitsigns = true,
        tmux = true,
      },
    })
  end,

  init = function()
    -- Initialization space
  end,
}

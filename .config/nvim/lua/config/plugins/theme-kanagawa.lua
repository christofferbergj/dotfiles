return {
  "rebelot/kanagawa.nvim",
  enabled = false,
  lazy = false,
  cond = not vim.g.vscode,

  config = function()
    require('kanagawa').setup({
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      variablebuiltinStyle = { italic = true },
      specialReturn = true,    -- special highlight for the return keyword
      specialException = true, -- special highlight for exception handling keywords
      transparent = true,      -- do not set background color
      dimInactive = false,     -- dim inactive window `:h hl-NormalNC`
      globalStatus = false,    -- adjust window separators highlight for laststatus=3
      terminalColors = true,   -- define vim.g.terminal_color_{0,17}
      colors = {},
      overrides = {},
      theme = "default" -- Load "default" theme or the experimental "light" theme
    })
  end,

  init = function()
    vim.o.background = "dark" -- or "light" for light mode
    vim.cmd("colorscheme kanagawa")
  end
}

return {
  'projekt0n/github-nvim-theme',
  cond = not vim.g.vscode,
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  enabled = false,
  config = function()
    require('github-theme').setup({
      -- ...
    })

    vim.cmd('colorscheme github_dark_dimmed')
  end,
}

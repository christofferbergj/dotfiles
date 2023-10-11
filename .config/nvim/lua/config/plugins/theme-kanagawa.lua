return {
  "rebelot/kanagawa.nvim",
  enabled = false,
  priority = 1000,

  init = function()
    vim.o.background = "dark" -- or "light" for light mode
    vim.cmd("colorscheme kanagawa")
  end
}

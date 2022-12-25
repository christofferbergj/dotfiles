return {
  "rose-pine/neovim",
  lazy = false,
  enabled = false,

  config = function()
    require("rose-pine").setup({
      dark_variant = "moon",
      disable_background = true,
    })
  end,

  init = function()
    vim.cmd([[colorscheme rose-pine]])
  end
}

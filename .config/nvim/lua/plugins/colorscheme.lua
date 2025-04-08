return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
    },
  },

  -- configure LazyVim to load theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "default",
    },
  },
}

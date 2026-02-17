return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "ramojus/mellifluous.nvim",
  },

  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "nexxeln/vesper.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
  },

  -- configure LazyVim to load theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}

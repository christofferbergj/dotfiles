return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" }
  },
  keys = {
    {
      "<leader>r", "<esc><cmd>lua require('refactoring').select_refactor()<cr>",
      mode = "v",
      noremap = true,
      silent = true,
      expr = false,
    },
  },
  config = {},
}

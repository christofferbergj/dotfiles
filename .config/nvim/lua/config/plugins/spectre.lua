return {
  "windwp/nvim-spectre",
  enabled = true,
  config = true,
  keys = {
    { "<leader>ss", "<cmd>lua require('spectre').open()<cr>", desc = "Spectre search" },
    { "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", desc = "Spectre" },
    { "<leader>s", "<esc>:lua require('spectre').open_visual()<CR>", mode = "v", desc = "Spectre" },
  },
}

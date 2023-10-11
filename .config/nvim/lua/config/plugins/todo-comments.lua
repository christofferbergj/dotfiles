local M = {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = "BufReadPost",
  keys = {
    { "<leader>]t", "<cmd>lua require('todo-comments').jump_next()<cr>", desc = "Next todo comment" },
    { "<leader>[t", "<cmd>lua require('todo-comments').jump_prev()<cr>", desc = "Previous todo comment"},
  },
}

return M

local M = {
  "folke/todo-comments.nvim",
  cond = not vim.g.vscode,
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = "BufReadPost",
  config = {},
  keys = {
    {
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Next todo comment",
    },
    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Previous todo comment",
    },
  },
}

return M

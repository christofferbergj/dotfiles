return {
  "smjonas/inc-rename.nvim",
  event = "BufReadPost",
  cond = not vim.g.vscode,

  config = function()
    require("inc_rename").setup({
      input_buffer_type = "dressing",
    })
  end,

  init = function()
    vim.keymap.set("n", "<leader>rn", ":IncRename ", { desc = "Rename symbol under cursor" })
  end,
}

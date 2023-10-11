return {
  "NeogitOrg/neogit",
  enabled = true,
  cmd = "Neogit",
  dependencies = {
    { "nvim-lua/plenary.nvim" }
  },

  config = function()
    require("neogit").setup({
      kind = "vsplit",
      integrations = { diffview = true },
    })
  end,

  init = function()
    local bind = vim.keymap.set

    bind("n" , "<leader>gg", "<cmd>Neogit<cr>", { desc = "Neogit" })
  end,
}

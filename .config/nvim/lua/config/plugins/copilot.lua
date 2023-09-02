return {
  "zbirenbaum/copilot.lua",
  enabled = true,
  event = "VeryLazy",
  cond = not vim.g.vscode,

  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 40,
        keymap = {
          accept = "<M-a>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
    })
  end,

  init = function()
    -- Initialization space
  end,

  test = function()
    -- Test function space
  end,
}

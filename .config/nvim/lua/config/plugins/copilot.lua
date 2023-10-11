return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",

  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 50,
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
}

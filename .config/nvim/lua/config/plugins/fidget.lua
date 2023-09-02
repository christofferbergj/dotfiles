return {
  "j-hui/fidget.nvim",
  enabled = true,
  tag = "legacy",
  cond = not vim.g.vscode,

  config = function()
    require("fidget").setup({
      text = {
        spinner = "line", -- animation shown when tasks are ongoing
        done = "✓", -- character shown when all tasks are complete
        commenced = "Started", -- message shown when task starts
        completed = "Completed", -- message shown when task completes
      },
    })
  end,

  init = function()
    -- Initialization space
  end,
}

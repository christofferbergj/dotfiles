return {
  "numToStr/Comment.nvim",
  event = "BufReadPost",
  cond = not vim.g.vscode,

  config = function()
    require('Comment').setup({
      -- add jsx/tsx support
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    })
  end
}

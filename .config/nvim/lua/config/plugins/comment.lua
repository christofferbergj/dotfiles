-- Smart and Powerful commenting plugin for neovim
-- https://github.com/numToStr/Comment.nvim
return {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    config = function()
        require('Comment').setup({
            -- add jsx/tsx support
            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        })
    end
}

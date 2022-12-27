local M = {
    "gbprod/yanky.nvim",
    enabled = true,
    event = "BufReadPost",
    dependencies = {
        "kkharji/sqlite.lua",
    },
}

function M.config()
    require("yanky").setup({
        highlight = {
            timer = 100,
        },
        preserve_cursor_position = {
            enabled = true,
        },
    })

    local bind = vim.keymap.set

    bind({ "n", "x" }, "y", "<Plug>(YankyYank)")
    bind({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
    bind({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
    bind({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
    bind({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
    bind("n", "]p", "<Plug>(YankyPutAfterFilter)")
    bind("n", "[p", "<Plug>(YankyPutBeforeFilter)")
    bind("n", "<leader>P", "<cmd>lua require('telescope').extensions.yank_history.yank_history()<cr>", { desc = "Yank history" })
end

return M

local M = {
    "akinsho/nvim-toggleterm.lua",
    cmd = { "ToggleTerm" },
}

function M.toggle_git_ui()
    local Terminal = require("toggleterm.terminal").Terminal
    local gitui = Terminal:new({
        cmd = "gitui",
        direction = "float",
        hidden = true,
        -- full size
        float_opts = {
            border = "single",
            width = vim.o.columns,
            height = vim.o.lines,
        },
        -- refresh buffer on close
        on_close = function()
            vim.cmd("checktime")
        end,
    })


    gitui:toggle()
end

function M.config()
    require("toggleterm").setup()

    -- Esc twice to get to normal mode
    vim.cmd([[tnoremap <esc><esc> <C-\><C-N>]])
end

function M.init()
    vim.keymap.set("n", "<leader>tg", function()
        require("config.plugins.toggleterm").toggle_git_ui()
    end, { desc = "ToggleTerm Git UI" })
end

return M

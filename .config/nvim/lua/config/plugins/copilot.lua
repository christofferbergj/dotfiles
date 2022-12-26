local M = {
    "zbirenbaum/copilot.lua",
    enabled = true,
    event = "VeryLazy",
}

function M.config()
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
end

function M.test() end

return M

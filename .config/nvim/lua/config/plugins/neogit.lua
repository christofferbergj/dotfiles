return {
    "TimUntersberger/neogit",
    enabled = true,
    cmd = "Neogit",
    dependencies = {
        { "nvim-lua/plenary.nvim" }
    },

    config = function()
        require("neogit").setup({
            kind = "split",
            integrations = { diffview = true },
        })
    end,

    init = function()
        local wk = require("which-key")
        local binds = {
            g = {
                n = { "<cmd>Neogit kind=split<cr>", "Neogit" }
            }
        }

        wk.register(binds, { prefix = "<leader>" })
    end,
}

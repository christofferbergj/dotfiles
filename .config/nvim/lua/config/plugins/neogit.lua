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
        vim.keymap.set("n", "<leader>gg", "<cmd>Neogit kind=split<cr>", { desc = "Neogit" })
    end,
}

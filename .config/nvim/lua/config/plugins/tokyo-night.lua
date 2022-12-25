return {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,

    init = function()
        vim.o.background = "dark" -- or "light" for light mode
        vim.cmd([[colorscheme tokyonight]])
    end
}

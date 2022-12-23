return {
    'folke/tokyonight.nvim',

    lazy = false,
    enabled = false,

    init = function()
        vim.o.background = "dark" -- or "light" for light mode
        vim.cmd([[colorscheme tokyonight]])
    end
}

local M = {
    "VonHeikemen/lsp-zero.nvim",
    enabled = true,
    event = "BufReadPost",

    dependencies = {
        -- UI for nvim-lsp progress
        { "j-hui/fidget.nvim" },

        -- LSP Support
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },

        -- Autocompletion
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lua" },

        -- Snippets
        { "L3MON4D3/LuaSnip" },
    }
}

function M.config()
    local lsp = require('lsp-zero')
    lsp.preset('recommended')
    lsp.nvim_workspace()
    lsp.setup()
end

return M

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

        -- navic
        { "SmiteshP/nvim-navic" },

        -- Snippets
        { "L3MON4D3/LuaSnip" },
    }
}

function M.config()
    local lsp = require('lsp-zero')
    local navic = require("nvim-navic")

    lsp.preset('recommended')
    lsp.nvim_workspace()

    -- attach navic
    lsp.on_attach(function(client, bufnr)
        navic.attach(client, bufnr)
    end)

    lsp.setup()
end

function M.init()
    vim.keymap.set("n", "<leader>cr", ":lua vim.lsp.buf.rename()<cr>", { desc = "Rename symbol under cursor" })
    vim.keymap.set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<cr>", { desc = "Code action" })
end

return M

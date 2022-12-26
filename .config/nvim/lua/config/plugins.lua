return {
    "folke/neodev.nvim",
    "folke/which-key.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    { "Pocco81/auto-save.nvim", event = "VeryLazy", config = true },

    -- Search and replace stuff
    "windwp/nvim-spectre",

    {
        "dstein64/vim-startuptime",
        -- lazy-load on a command
        cmd = "StartupTime",
    },

    -- Use treesitter to auto-close and auto-rename html tag
    { "windwp/nvim-ts-autotag", event = "InsertEnter", config = true },

    -- Useful status updates for LSP
    { "j-hui/fidget.nvim", config = true },

    { "stevearc/dressing.nvim", event = "VeryLazy" },

    { "andymass/vim-matchup", event = "BufRead", config = true },

    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        config = function()
            require("trouble").setup({
                auto_open = false,
                use_diagnostic_signs = true,
            })
        end,
    },

    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        config = function()
            require("zen-mode").setup({
                plugins = {
                    gitsigns = true,
                    tmux = true,
                },
            })
        end,
    },
}

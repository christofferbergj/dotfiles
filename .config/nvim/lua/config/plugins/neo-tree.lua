return {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = true,
    cmd = "Neotree",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },

    config = function()
        require("neo-tree").setup({
            filesystem = {
                follow_current_file = true,
                hijack_netrw_behavior = "open_current",
            },
        })
    end,

    init = function()
        vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    end,
}



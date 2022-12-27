return {
    "nvim-tree/nvim-tree.lua",
    enabled = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree toggle" },
        { "<leader>n", "<cmd>NvimTreeFocus<cr>", desc = "NvimTree focus" },
    },

    config = function()
        require("nvim-tree").setup({
            sync_root_with_cwd = true,
            respect_buf_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = true
            },
            view = {
              side = "right",
              width = 50
            }
        })
    end,

    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end
}

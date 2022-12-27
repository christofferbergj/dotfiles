return {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    event = "BufReadPost",

    dependencies = {
        -- navic
        { "SmiteshP/nvim-navic" },
    },

    config = function()
        local navic = require("nvim-navic")

        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "auto",
                disabled_filetypes = {},
                section_separators = {},
                component_separators = {},
                always_divide_middle = true,
                globalstatus = false,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = {
                    { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                    { "filename", path = 1 },
                    { navic.get_location, cond = navic.is_available },
                },
                lualine_x = { "diagnostics", "diff", "filetype" },
                lualine_y = { "location" },
                lualine_z = { "progress" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = { "nvim-tree" },
        })
    end
}

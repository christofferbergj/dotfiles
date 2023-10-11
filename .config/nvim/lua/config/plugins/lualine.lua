return {
  "nvim-lualine/lualine.nvim",
  event = "BufReadPost",

  config = function()
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
        lualine_a = { "branch" },
        lualine_b = {
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1 },
        },
        lualine_c = {},
        lualine_x = { "diagnostics", "diff", "filetype" },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "neo-tree" },
    })
  end
}

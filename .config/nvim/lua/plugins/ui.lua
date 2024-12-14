return {
  -- disabled ui plugins
  { "echasnovski/mini.indentscope", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },
  { "folke/noice.nvim", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 2000,
      render = "minimal",
    },
  },

  -- filename
  {
    "b0o/incline.nvim",
    dependencies = {},
    event = "VeryLazy",
    priority = 1200,
    config = function()
      local helpers = require("incline.helpers")
      require("incline").setup({
        window = {
          padding = 0,
          margin = { horizontal = 0 },
          placement = {
            vertical = "top",
          },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          local buffer = {
            ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            { filename, gui = modified and "bold,italic" or "bold" },
            " ",
            guibg = "#223249",
          }
          return buffer
        end,
      })
    end,
  },
}

return {
  -- disabled ui plugins
  { "mini-nvim/mini.indentscope", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },
  { "folke/noice.nvim", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },
  { "nvim-lualine/lualine.nvim", enabled = false },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 2000,
      render = "minimal",
    },
  },

  -- snacks config
  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
      indent = { enabled = false },
      picker = {
        sources = {
          files = { hidden = true },
          grep = { hidden = true },
          explorer = { hidden = true },
        },
      },
    },
  },

  -- prettier diagnostic messages
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000, -- needs to be loaded in first
    config = function()
      vim.diagnostic.config({ virtual_text = false })

      require("tiny-inline-diagnostic").setup()
    end,
  },

  -- filename
  {
    "b0o/incline.nvim",
    dependencies = {},
    event = "VeryLazy",
    priority = 1200,
    enabled = false,
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
            guibg = "#282828",
          }
          return buffer
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = { max_lines = 2 },
  },
}

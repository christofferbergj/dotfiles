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
      disable_netrw = true,
      hijack_netrw = true,
      open_on_setup = false,
      ignore_ft_on_setup = {},
      open_on_tab = false,
      hijack_cursor = false,
      update_cwd = true,
      diagnostics = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
      },
      system_open = {
        cmd = nil,
        args = {},
      },
      filters = {
        dotfiles = false,
        custom = { ".git", ".DS_Store" },
        exclude = { ".gitignore", ".github" },
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 500,
      },
      renderer = {
        icons = {
          git_placement = "after",
          padding = "  ",
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "",
              unmerged = "",
              renamed = "➜",
              untracked = "",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      view = {
        width = 50,
        hide_root_folder = false,
        side = "right",
        mappings = {
          custom_only = false,
          list = {
            { key = "<C-k>", action = "" },
            { key = "J", action = "first_sibling" },
            { key = "O", action = "expand_all" },
            { key = "K", action = "last_sibling" },
            { key = "S", action = "system_open" },
            { key = "s", action = "search_node" },
            { key = "cd", action = "cd" },
          },
        },
        number = false,
        relativenumber = false,
      },
      trash = {
        cmd = "trash",
        require_confirm = true,
      },
      actions = {
        open_file = {
          quit_on_open = false,
          window_picker = {
            enable = false,
          },
        },
      },
    })
  end,

  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end
}

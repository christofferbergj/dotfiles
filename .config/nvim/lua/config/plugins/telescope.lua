local M = {
  "nvim-telescope/telescope.nvim",
  enabled = true,
  cmd = { "Telescope" },

  dependencies = {
    { "ahmedkhalf/project.nvim" },
    { "kkharji/sqlite.lua" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-frecency.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-symbols.nvim" },
  },
}

function M.project_files(opts)
  local builtin = require("telescope.builtin")
  opts = opts or {}
  opts.show_untracked = true

  if vim.loop.fs_stat(".git") then
    builtin.git_files(opts)
  else
    local client = vim.lsp.get_active_clients()[1]
    if client then
      opts.cwd = client.config.root_dir
    end
    builtin.find_files(opts)
  end
end

function M.config()
  local actions = require("telescope.actions")
  local telescope = require("telescope")

  telescope.setup({
    extensions = {
      frecency = {
        default_workspace = "CWD",
        show_filter_column = false,
        show_unindexed = false
      },
    },
    pickers = {
      buffers = {
        sort_lastused = true
      }
    },
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      border = true,
      winblend = 0,
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.5,
          results_width = 0.5,
          width = 0.85,
          height = 0.85,
        },
      },
      mappings = {
        i = {
          ["<c-j>"] = actions.move_selection_next,
          ["<c-k>"] = actions.move_selection_previous,
        },

        n = {
          ["q"] = actions.close,
          ["<c-j>"] = actions.move_selection_next,
          ["<c-k>"] = actions.move_selection_previous,
        }
      },
    },
  })

  telescope.load_extension("file_browser")
  telescope.load_extension("frecency")
  telescope.load_extension("fzf")
  telescope.load_extension("projects")
end

function M.init()
  local builtin = require("telescope.builtin")
  local themes = require('telescope.themes')
  local wk = require("which-key")
  local bind = vim.keymap.set

  bind("n", "<A-e>", "<cmd>Telescope buffers initial_mode=normal<cr>", { desc = "Open buffers" })
  bind("n", "<A-w>", "<cmd>Telescope frecency<cr>", { desc = "Open recent files" })
  bind("n", "<A-r>", "<cmd>Telescope frecency<cr>", { desc = "Open recent files" })
  bind("n", "<A-p>", "<cmd>lua require('config.plugins.telescope').project_files()<cr>", { desc = "Find files" })
  bind("n", "<A-f>",
    "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ previewer = false }))<cr>"
    , { desc = "Find in current buffer" })

  local binds = {
    h = {
      t = { "<cmd>Telescope builtin<cr>", "Telescope" },
      c = { "<cmd>Telescope commands<cr>", "Commands" },
      h = { "<cmd>Telescope help_tags<cr>", "Help pages" },
      m = { "<cmd>Telescope man_pages<cr>", "Man pages" },
      k = { "<cmd>Telescope keymaps<cr>", "Key maps" },
      s = { "<cmd>Telescope highlights<cr>", "Search highlight groups" },
      f = { "<cmd>Telescope filetypes<cr>", "File types" },
      o = { "<cmd>Telescope vim_options<cr>", "Options" },
      a = { "<cmd>Telescope autocommands<cr>", "Auto commands" },
    },
    f = {
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document symbols" },
      S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace symbols" },
      g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
      w = { "<cmd>Telescope grep_string<cr>", "Grep word" },
      h = { "<cmd>Telescope help_tags<cr>", "Help tags" },
      b = { "<cmd>Telescope file_browser<cr>", "Projects" },
      B = { "<cmd>Telescope buffers initial_mode=normal<cr>", "Open buffers" },
      n = { "<cmd>Telescope find_files cwd=~/.config/nvim<cr>", "Nvim config files" },
      t = { "<cmd>TodoTelescope initial_mode=normal<cr>", "Todo comments" },
      d = { "<cmd>Telescope diagnostics initial_mode=normal<cr>", "Diagnostics" },
      f = { "<cmd>lua require('config.plugins.telescope').project_files()<cr>", "Project files" },
      o = { "<cmd>Telescope oldfiles<cr>", "Old files" },
      r = { "<cmd>Telescope frecency<cr>", "Recent files" },
      p = { "<cmd>Telescope projects<cr>", "Projects" },
      y = { "<cmd>lua require('telescope').extensions.yank_history.yank_history()<cr>", "Yank history" },
      ["."] = { "<cmd>Telescope find_files cwd=~/.config<cr>", "Dotfiles" },
      ["/"] = {
        function()
          local opts = themes.get_dropdown { previewer = false }
          builtin.current_buffer_fuzzy_find(opts)
        end, "Current buffer"
      },
    },
    g = {
      c = { "<cmd>Telescope git_commits<cr>", "Commits" },
      b = { "<cmd>Telescope git_branches<cr>", "Branches" },
      s = { "<cmd>Telescope git_status<cr>", "Status" },
    },
    b = {
      o = { "<cmd>Telescope buffers initial_mode=normal<cr>", "Buffers" },
    }
  }

  wk.register(binds, { prefix = "<leader>" })
end

return M

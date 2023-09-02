local M = {
  "akinsho/nvim-toggleterm.lua",
  enabled = true,
  cmd = { "ToggleTerm" },
  config = true,
  cond = not vim.g.vscode,
}

-- Default options
local defaultFloatOpts = {
  direction = "float",
  hidden = true,
  -- full size curved border
  float_opts = {
    border = "curved",
    width = vim.o.columns,
    height = vim.o.lines,
  },
  -- add qq keybinding to close the terminal
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "qq", "<cmd>close<cr>", { noremap = true, silent = true })
  end,
  -- refresh buffer on close
  on_close = function()
    vim.cmd("checktime")
  end,
}


function M.toggle_default_float()
  local Terminal = require("toggleterm.terminal").Terminal
  local default = Terminal:new(defaultFloatOpts)

  default:toggle()
end

function M.toggle_git_ui()
  local Terminal = require("toggleterm.terminal").Terminal
  local opts = vim.tbl_deep_extend("force", defaultFloatOpts, { cmd = "gitui" })
  local gitui = Terminal:new(opts)

  gitui:toggle()
end

function M.init()
  local wk = require("which-key")
  local binds = {
    t = {
      t = { "<cmd>lua require('config.plugins.toggleterm').toggle_default_float()<cr>", "Terminal" },
      g = { "<cmd>lua require('config.plugins.toggleterm').toggle_git_ui()<cr>", "Gitui" },
    }
  }

  wk.register(binds, { prefix = "<leader>" })

  -- Esc twice to get to normal mode
  vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { noremap = true, silent = true })
end

return M

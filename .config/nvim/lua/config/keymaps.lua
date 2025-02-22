-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

local opts = { noremap = true, silent = true }

-- Insert mode escape sequences
map("i", "jj", "<Esc>A", opts)
map("i", "jk", "<Esc>", opts)

-- Search with center screen
map("n", "#", "#zz", opts)
map("n", "*", "*zz", opts)
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)

-- Navigation
map("n", "0", "^", opts)
map("n", "^", "0", opts)
map("n", "H", "^", opts)
map("n", "L", "$", opts)
map("v", "H", "^", opts)
map("v", "L", "$", opts)

-- Text manipulation
map("n", "<Tab>", "viw", opts)
map("n", "J", "mzJ`z", opts)
map("n", "Y", "y$", opts)

-- Visual mode special operations
map("v", "p", '"_dP', opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Scrolling with center (you already have these)
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half a page and center" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half a page and center" })

-- x to void
map("n", "x", '"_x')

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Redo with Shift+U (undo remains on default 'u')
map("n", "U", "<C-r>", opts)

-- Tabs
-- map("n", "te", ":tabedit")
-- map("n", "<tab>", ":tabnext<Return>", opts)
-- map("n", "<s-tab>", ":tabprev<Return>", opts)
-- map("n", "tw", ":tabclose<Return>", opts)

-- Diagnostics (LSP)
map("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

-- Diagnostics (LSP)
map("n", "<C-k>", function()
  vim.diagnostic.goto_prev()
end, opts)

-- Treesitter selection
map("n", "<Tab>", function()
  vim.cmd("normal! v")
  require("nvim-treesitter.incremental_selection").init_selection()
end, opts)

map("v", "<Tab>", function()
  require("nvim-treesitter.incremental_selection").node_incremental()
end, opts)

map("v", "<S-Tab>", function()
  require("nvim-treesitter.incremental_selection").node_decremental()
end, opts)

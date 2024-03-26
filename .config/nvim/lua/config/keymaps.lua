-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Center the screen when scrolling
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half a page and center" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half a page and center" })

local opts = { noremap = true, silent = true }

map("n", "x", '"_x')

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Tabs
map("n", "te", ":tabedit")
map("n", "<tab>", ":tabnext<Return>", opts)
map("n", "<s-tab>", ":tabprev<Return>", opts)
map("n", "tw", ":tabclose<Return>", opts)

-- Diagnostics (LSP)
map("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

-- Diagnostics (LSP)
map("n", "<C-k>", function()
  vim.diagnostic.goto_prev()
end, opts)

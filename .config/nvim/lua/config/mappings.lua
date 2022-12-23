-- Switch buffers with ctrl + arrow keys
vim.keymap.set("n", "<C-Left>", "<cmd>bprevious<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>bnext<cr>")

-- clear highlights with escape
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

-- always center view when scrolling half a page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--  redo with shift-u
vim.keymap.set("n", "U", "<C-r>")

local bind = vim.keymap.set

-- Scroll half a page and center
bind("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half a page and center" })
bind("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half a page and center" })

-- Navigate buffers
bind("n", "<C-Left>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
bind("n", "<C-Right>", "<cmd>bnext<cr>", { desc = "Next buffer" })
bind("n", "[b", "<cmd>:bprevious<cr>", { desc = "Previous buffer" })
bind("n", "]b", "<cmd>:bnext<cr>", { desc = "Next buffer" })

-- Redo with shift-u
bind("n", "U", "<C-r>", { desc = "Redo" })

-- Clear highlights with escape
bind({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear highlights" })

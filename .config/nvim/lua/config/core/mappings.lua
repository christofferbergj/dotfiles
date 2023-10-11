local bind = vim.keymap.set

-- scroll half a page and center
bind("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half a page and center" })
bind("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half a page and center" })

-- navigate buffers
bind("n", "[b", "<cmd>:bprevious<cr>", { desc = "Previous buffer" })
bind("n", "]b", "<cmd>:bnext<cr>", { desc = "Next buffer" })

-- redo with shift-u
bind("n", "U", "<C-r>", { desc = "Redo" })

-- clear highlights with escape
bind({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear highlights" })

-- telescope recent files on control+r current cwd
--bind("n", "<C-r>", "<cmd>Telescope frecency<cr>", { desc = "Recent files" })

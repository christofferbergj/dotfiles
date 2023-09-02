local bind = vim.keymap.set

-- Navigate diagnostics
bind("n", "<A-j>", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next diagnostic" })
bind("n", "<A-k>", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Previous diagnostic" })

-- Telescope recent files on control+r current cwd
bind("n", "<C-r>", "<cmd>Telescope frecency<cr>", { desc = "Recent files" })

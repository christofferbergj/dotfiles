local wk = require("which-key")
local bind = vim.keymap.set

-- Switch buffers with ctrl + arrow keys
bind("n", "<C-Left>", "<cmd>bprevious<cr>")
bind("n", "<C-Right>", "<cmd>bnext<cr>")

-- clear highlights with escape
bind({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

-- always center view when scrolling half a page
bind("n", "<C-d>", "<C-d>zz")
bind("n", "<C-u>", "<C-u>zz")

--  redo with shift-u
bind("n", "U", "<C-r>")


-- which-key leader mappings
local leader = {
    w = {
        name = "+window",
        ["w"] = { "<C-W>p", "Other window" },
        ["d"] = { "<C-W>c", "Delete window" },
        ["h"] = { "<C-W>h", "Window left" },
        ["j"] = { "<C-W>j", "Window below" },
        ["l"] = { "<C-W>l", "Window right" },
        ["k"] = { "<C-W>k", "Window up" },
        ["H"] = { "<C-W>5<", "Expand window left" },
        ["J"] = { ":resize +5", "Expand window below" },
        ["L"] = { "<C-W>5>", "Expand window wight" },
        ["K"] = { ":resize -5", "Expand window up" },
        ["="] = { "<C-W>=", "Balance window" },
        ["s"] = { "<C-W>s", "Split window below" },
        ["v"] = { "<C-W>v", "Split window wight" },
    },
    c = {
        name = "+code",
    },
    f = {
      name = "+find"
    },
    b = {
        name = "+buffer",
        ["b"] = { "<cmd>:e #<cr>", "Switch to other buffer" },
        ["p"] = { "<cmd>:bprevious<cr>", "Previous buffer" },
        ["["] = { "<cmd>:bprevious<cr>", "Previous buffer" },
        ["n"] = { "<cmd>:bnext<cr>", "Next buffer" },
        ["]"] = { "<cmd>:bnext<cr>", "Next buffer" },
        ["d"] = { "<cmd>:bd<cr>", "Delete buffer & window" },
    },
    g = {
        name = "+git",
        d = { "<cmd>DiffviewOpen<cr>", "DiffView" },
        h = { name = "+hunk" },
    },
}

wk.register(leader, { prefix = "<leader>" })


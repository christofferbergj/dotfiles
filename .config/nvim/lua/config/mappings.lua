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
        ["w"] = { "<C-W>p", "Other Window" },
        ["d"] = { "<C-W>c", "Delete Window" },
        ["h"] = { "<C-W>h", "Window Left" },
        ["j"] = { "<C-W>j", "Window Below" },
        ["l"] = { "<C-W>l", "Window Right" },
        ["k"] = { "<C-W>k", "Window Up" },
        ["H"] = { "<C-W>5<", "Expand Window Left" },
        ["J"] = { ":resize +5", "Expand Window Below" },
        ["L"] = { "<C-W>5>", "Expand Window Right" },
        ["K"] = { ":resize -5", "Expand Window Up" },
        ["="] = { "<C-W>=", "Balance Window" },
        ["s"] = { "<C-W>s", "Split Window Below" },
        ["v"] = { "<C-W>v", "Split Window Right" },
    },
    c = {
        name = "+code",
    },
    f = {
      name = "+find"
    },
    b = {
        name = "+buffer",
        ["b"] = { "<cmd>:e #<cr>", "Switch to Other Buffer" },
        ["p"] = { "<cmd>:bprevious<cr>", "Previous Buffer" },
        ["["] = { "<cmd>:bprevious<cr>", "Previous Buffer" },
        ["n"] = { "<cmd>:bnext<cr>", "Next Buffer" },
        ["]"] = { "<cmd>:bnext<cr>", "Next Buffer" },
        ["d"] = { "<cmd>:bd<cr>", "Delete Buffer & Window" },
    },
    g = {
        name = "+git",
        c = { "<cmd>Telescope git_commits<cr>", "Commits" },
        b = { "<cmd>Telescope git_branches<cr>", "Branches" },
        s = { "<cmd>Telescope git_status<cr>", "Status" },
        d = { "<cmd>DiffviewOpen<cr>", "DiffView" },
        h = { name = "+hunk" },
    },
    h = {
        name = "+help",
        t = { "<cmd>:Telescope builtin<cr>", "Telescope" },
        c = { "<cmd>:Telescope commands<cr>", "Commands" },
        h = { "<cmd>:Telescope help_tags<cr>", "Help Pages" },
        m = { "<cmd>:Telescope man_pages<cr>", "Man Pages" },
        k = { "<cmd>:Telescope keymaps<cr>", "Key Maps" },
        s = { "<cmd>:Telescope highlights<cr>", "Search Highlight Groups" },
        f = { "<cmd>:Telescope filetypes<cr>", "File Types" },
        o = { "<cmd>:Telescope vim_options<cr>", "Options" },
        a = { "<cmd>:Telescope autocommands<cr>", "Auto Commands" },
    },
}

wk.register(leader, { prefix = "<leader>" })


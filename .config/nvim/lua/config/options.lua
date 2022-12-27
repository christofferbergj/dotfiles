vim.g.mapleader = " "

local set = vim.opt

set.clipboard = "unnamedplus"
set.autoread = true -- reload file if changed outside of vim
set.autowrite = true -- save file when switching buffers
set.autowriteall = true -- save all files when quitting
set.backup = false -- creates a backup file
set.cmdheight = 0 -- more space in the neovim command line for displaying messages
set.completeopt = "menuone,noselect" -- mostly just for cmp
set.conceallevel = 0 -- so that `` is visible in markdown files
set.fileencoding = "utf-8" -- the encoding written to a file
set.hlsearch = true -- highlight all matches on previous search pattern
set.incsearch = true -- incremental search
set.ignorecase = true -- ignore case in search patterns
set.mouse = "a" -- allow the mouse to be used in neovim
set.pumheight = 10 -- pop up menu height
set.showmode = false -- we don't need to see things like -- INSERT -- anymore
set.smartcase = true -- smart case
set.smartindent = true -- make indenting smarter again
set.splitbelow = true -- force all horizontal splits to go below current window
set.splitright = true -- force all vertical splits to go to the right of current window
set.swapfile = false -- creates a swapfile
set.termguicolors = true -- set term gui colors (most terminals support this)
set.timeoutlen = 400 -- time to wait for a mapped sequence to complete (in milliseconds)
set.undofile = true -- enable persistent undo
set.updatetime = 750 -- faster completion (4000ms default)
set.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
set.expandtab = true -- convert tabs to spaces
set.shiftwidth = 2 -- the number of spaces inserted for each indentation
set.tabstop = 2 -- insert 2 spaces for a tab
set.cursorline = true -- highlight the current line
set.number = true -- set numbered lines
set.relativenumber = true -- set relative numbered lines
set.foldcolumn = "1" -- set the column where folds are displayed
set.numberwidth = 4 -- set number column width to 4 {default 4}
set.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
set.wrap = true -- display lines as one long line
set.scrolloff = 8 -- always show 8 lines above and below cursor
set.sidescrolloff = 8 -- always show 8 columns left and right of cursor
set.list = true -- show some invisible characters (tabs...)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- bootstrap from github
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

vim.opt.runtimepath:prepend(lazypath)

-- load lazy and all plugins in the plugins file and folder
require("lazy").setup("config.plugins", {
    defaults = { lazy = true },
    checker = { enabled = true },
    debug = true,
})

vim.keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>", opts)

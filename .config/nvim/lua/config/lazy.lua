local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- bootstrap from github
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- load lazy and all plugins in the plugins file and folder
require("lazy").setup({ { import = "config.plugins" }, { import = "config.plugins.lsp" } }, {
  defaults = {
    lazy = true,
  },
  checker = {
    enabled = true, -- automatically check for plugin updates
    notify = false, -- get a notification when new updates are found
    frequency = 3600, -- check for updates every hour
  },
  change_detection = {
    enabled = true, -- automatically check for config file changes and reload the ui
    notify = false, -- get a notification when changes are found
  },
  debug = false,
})

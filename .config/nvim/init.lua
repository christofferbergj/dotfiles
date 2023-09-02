require("config.options")
require("config.lazy")
require("config.mappings")

if vim.g.vscode then
  -- vscode
  require("config.vscode.mappings")
else
  -- neovim
  require("config.nvim.mappings")
  require("config.nvim.commands")
end

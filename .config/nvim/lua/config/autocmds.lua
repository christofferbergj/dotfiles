-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspAttach_conflicts", {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "eslint" then
      local clients = vim.lsp.get_clients()
      for _, client_ in pairs(clients) do
        if client_.name == "tsserver" then
          client_.server_capabilities.documentFormattingProvider = false
        end
      end
    end
  end,
})

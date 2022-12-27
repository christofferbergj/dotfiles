local M = {
  "VonHeikemen/lsp-zero.nvim",
  enabled = true,
  event = "BufReadPost",

  dependencies = {
    -- UI for nvim-lsp progress
    { "j-hui/fidget.nvim" },

    -- LSP Support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },

    -- navic
    { "SmiteshP/nvim-navic" },

    -- Snippets
    { "L3MON4D3/LuaSnip" },
  }
}

function M.config()
  local lsp = require('lsp-zero')
  local navic = require("nvim-navic")
  local cmp = require('cmp')

  lsp.preset('recommended')
  lsp.nvim_workspace()

  -- attach navic
  lsp.on_attach(function(client, bufnr)
    navic.attach(client, bufnr)
  end)

  local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-Space>'] = cmp.mapping.complete(),
  })

  local cmp_sources = lsp.defaults.cmp_sources({
    { name = 'nvim_lsp', keyword_length = 1 },
    { name = 'buffer', keyword_length = 1 },
  })

  -- cmp settings
  lsp.setup_nvim_cmp({
    sources = cmp_sources,
    mapping = cmp_mappings,
  })

  lsp.setup()
end

function M.init()
  local wk = require("which-key")


  local binds = {
    l = {
      name = "+lsp",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
      d = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", "Show diagnostics" },
      f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format document" },
      i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol under cursor" },
      s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature help" },
      t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type definition" },
      w = { "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", "Workspace symbol" },
    },
    c = {
      name = "+code",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol under cursor" },
    }
  }

  wk.register(binds, { prefix = "<leader>" })
end

return M

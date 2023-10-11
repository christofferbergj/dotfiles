return {
  "VonHeikemen/lsp-zero.nvim",
  event = "BufReadPost",

  dependencies = {
    -- lsp support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },

    -- autocompletion
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/nvim-cmp" },
    { "saadparwaiz1/cmp_luasnip" },

    -- snippets
    { "L3MON4D3/LuaSnip" },
  },

  config = function()
    local lsp_zero = require('lsp-zero')

    lsp_zero.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps({ buffer = bufnr })

      local opts = { buffer = bufnr }
      local bind = vim.keymap.set

      bind('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
      bind('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end)

    -- see :help lsp-zero-guide:integrate-with-mason-nvim
    -- to learn how to use mason.nvim with lsp-zero
    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
      },
      automatic_installation = true,
      handlers = {
        lsp_zero.default_setup,
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }
                }
              }
            }
          }
        end,
      }
    })

    require('mason-tool-installer').setup({

      -- a list of all tools you want to ensure are installed upon
      -- start; they should be the names Mason uses for each tool
      ensure_installed = {
        'prettierd',
        'eslint_d',
        'stylua',
      },
    })
  end,

  init = function()
    --local bind = vim.keymap.set
    --
    --bind("n", "<leader>l", "<cmd>lua require('lsp-zero').toggle()<cr>", { desc = "Toggle LSP" })
    --bind("n", "<leader>ld", "<cmd>lua require('lsp-zero').diagnostics()<cr>", { desc = "Show diagnostics" })
    --bind("n", "<leader>lr", "<cmd>lua require('lsp-zero').rename()<cr>", { desc = "Rename symbol under cursor" })
  end
}

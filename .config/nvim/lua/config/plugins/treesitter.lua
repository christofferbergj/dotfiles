local M = {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  dev = false,
  build = ":TSUpdate",
  event = "BufReadPost",
  cond = not vim.g.vscode,

  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
    "RRethy/nvim-treesitter-textsubjects",
    "mfussenegger/nvim-treehopper",
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/nvim-treesitter-textobjects",
    { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
  },
}

function M.init()
end

function M.config()
  require("nvim-treesitter.configs").setup({
    ignore_install = {},
    ensure_installed = {
      "bash",
      "css",
      "diff",
      "fish",
      "gitignore",
      "git_rebase",
      "go",
      "graphql",
      "help",
      "html",
      "http",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "markdown",
      "markdown_inline",
      "query",
      "regex",
      "rust",
      "scss",
      "sql",
      "svelte",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vue",
      "yaml",
    },
    sync_install = false,
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    context_commentstring = { enable = true, enable_autocmd = false },
    incremental_selection = {
      enable = false,
      keymaps = {
        init_selection = "<c-n>",
        node_incremental = "<c-n>",
        scope_incremental = "<c-s>",
        node_decremental = "<c-r>",
      },
    },
    textsubjects = {
      enable = true,
      keymaps = {
        ["."] = "textsubjects-smart",
        [";"] = "textsubjects-container-outer",
        ['i;'] = 'textsubjects-container-inner',
      },
    },
    textobjects = {
      select = {
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      move = {
        enable = false,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
        goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
        goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
        goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
      },
      lsp_interop = {
        enable = false,
        peek_definition_code = {
          ["gD"] = "@function.outer",
        },
      },
    },
    matchup = {
      enable = true,
    },
  })

  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  parser_config.markdown.filetype_to_parsername = "octo"
end

return M

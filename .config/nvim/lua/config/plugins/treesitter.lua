local M = {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    dev = false,
    build = ":TSUpdate",
    event = "BufReadPost",

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
        ensure_installed = {
            "bash",
            "css",
            "diff",
            "fish",
            "gitignore",
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
            enable = true,
            keymaps = {
                init_selection = "<C-n>",
                node_incremental = "<C-n>",
                scope_incremental = "<C-s>",
                node_decremental = "<C-r>",
            },
        },
        textsubjects = {
            enable = true,
            keymaps = {
                enable = true,
                prev_selection = ',', -- (Optional) keymap to select the previous selection
                keymaps = {
                    ['.'] = 'textsubjects-smart',
                    [';'] = 'textsubjects-container-outer',
                    ['i;'] = 'textsubjects-container-inner',
                },
            },
        },
        textobjects = {
            select = {
                enable = true,
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

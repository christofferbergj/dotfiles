local M = {
    "nvim-telescope/telescope.nvim",
    enabled = true,
    cmd = { "Telescope" },

    dependencies = {
        { "nvim-telescope/telescope-file-browser.nvim" },
        { "nvim-telescope/telescope-project.nvim" },
        { "nvim-telescope/telescope-symbols.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "nvim-lua/plenary.nvim" }
    },
}

function M.project_files(opts)
    local builtin = require("telescope.builtin")
    opts = opts or {}
    opts.show_untracked = true

    if vim.loop.fs_stat(".git") then
        builtin.git_files(opts)
    else
        local client = vim.lsp.get_active_clients()[1]
        if client then
            opts.cwd = client.config.root_dir
        end
        builtin.find_files(opts)
    end
end

function M.config()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
        extensions = {
            project = {
                base_dirs = {
                    { "~/code", max_depth = 3 },
                },
            },
        },
        defaults = {
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
            },
            prompt_prefix = "   ",
            selection_caret = "  ",
            entry_prefix = "  ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            border = true,
            winblend = 0,
            color_devicons = true,
            set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.5,
                    results_width = 0.5,
                    width = 0.85,
                    height = 0.85,
                },
            },
            mappings = {
                i = {
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                },

                n = {
                  ["q"] = actions.close,
                  ["<C-j>"] = actions.move_selection_next,
                  ["<C-k>"] = actions.move_selection_previous,
                }
            },
        },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")
    telescope.load_extension("project")
end

function M.init()
    local builtin = require("telescope.builtin")
    local custom = require("config.plugins.telescope")
    local extensions = require("telescope").extensions
    local themes = require('telescope.themes')
    local bind = vim.keymap.set

    -- live grep
    bind("n", "<leader>fg", function()
        builtin.live_grep()
    end, { desc = "Live grep" })

    -- word grep
    bind("n", "<leader>fw", function()
        builtin.grep_string()
    end, { desc = "Word" })

    -- help tags
    bind("n", "<leader>fh", function()
        builtin.help_tags()
    end, { desc = "Help tags" })

    -- open buffers
    bind("n", "<leader>fb", function()
        builtin.buffers()
    end, { desc = "Open buffers" })

    -- fuzzy search current buffer
    bind('n', '<leader>f/', function()
        local opts = themes.get_dropdown { previewer = false }
        builtin.current_buffer_fuzzy_find(opts)
    end, { desc = 'Current buffer' })

    -- nvim config files
    bind("n", "<leader>fn", function()
        builtin.find_files({ cwd = "~/.config/nvim" })
    end, { desc = "Neovim config files" })

    -- project files
    bind("n", "<leader>ff", function()
        custom.project_files()
    end, { desc = "Project files" })

    -- diagnostics
    bind("n", "<leader>fd", function()
        builtin.diagnostics({ initial_mode = "normal" })
    end, { desc = "Diagnostics" })

    -- old files
    bind("n", "<leader>fo", function()
        builtin.oldfiles()
    end, { desc = "Old files" })

    -- projects
    bind("n", "<leader>fp", function()
        extensions.project.project()
    end, { desc = "Projects" })

    -- file browser
    bind("n", "<leader>fB", function()
        extensions.file_browser.file_browser()
    end, { desc = "File browser" })

end

return M

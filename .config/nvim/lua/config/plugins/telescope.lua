local M = {
    "nvim-telescope/telescope.nvim",
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

    -- live grep
    vim.keymap.set("n", "<leader>fg", function()
        builtin.live_grep()
    end, { desc = "Live Grep" })

    -- help tags
    vim.keymap.set("n", "<leader>fh", function()
        builtin.help_tags()
    end, { desc = "Help Tags" })

    -- open buffers
    vim.keymap.set("n", "<leader>fb", function()
        builtin.buffers({})
    end, { desc = "Find Buffer" })

    -- nvim config files
    vim.keymap.set("n", "<leader>fn", function()
        builtin.find_files({ cwd = "~/.config/nvim" })
    end, { desc = "Find Nvim config file" })

    -- project files
    vim.keymap.set("n", "<leader><space>", function()
        custom.project_files()
    end, { desc = "Find Project File" })

    -- old files
    vim.keymap.set("n", "<leader>fo", function()
        builtin.oldfiles()
    end, { desc = "Find Old File" })

    -- projects
    vim.keymap.set("n", "<leader>fp", function()
        require("telescope").extensions.project.project()
    end, { desc = "Find Project" })

end

return M

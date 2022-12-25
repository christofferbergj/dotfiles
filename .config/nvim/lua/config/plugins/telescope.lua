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
    local themes = require('telescope.themes')
    local wk = require("which-key")

    local binds = {
        h = {
            t = { "<cmd>Telescope builtin<cr>", "Telescope" },
            c = { "<cmd>Telescope commands<cr>", "Commands" },
            h = { "<cmd>Telescope help_tags<cr>", "Help pages" },
            m = { "<cmd>Telescope man_pages<cr>", "Man pages" },
            k = { "<cmd>Telescope keymaps<cr>", "Key maps" },
            s = { "<cmd>Telescope highlights<cr>", "Search highlight groups" },
            f = { "<cmd>Telescope filetypes<cr>", "File types" },
            o = { "<cmd>Telescope vim_options<cr>", "Options" },
            a = { "<cmd>Telescope autocommands<cr>", "Auto commands" },
        },
        f = {
            g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
            w = { "<cmd>Telescope grep_string<cr>", "Grep word" },
            h = { "<cmd>Telescope help_tags<cr>", "Help tags" },
            b = { "<cmd>Telescope buffers<cr>", "Open buffers" },
            B = { "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", "Projects" },
            n = { "<cmd>Telescope find_files cwd=~/.config/nvim<cr>", "Nvim config files" },
            d = { "<cmd>Telescope diagnostics initial_mode=normal<cr>", "Diagnostics" },
            f = { "<cmd>lua require('config.plugins.telescope').project_files()<cr>", "Project files" },
            o = { "<cmd>Telescope oldfiles<cr>", "Old files" },
            p = { "<cmd>lua require('telescope').extensions.project.project()<cr>", "Projects" },
            ["/"] = {
                function()
                    local opts = themes.get_dropdown { previewer = false }
                    builtin.current_buffer_fuzzy_find(opts)
                end, "Current buffer"
            },
        },
        g = {
            c = { "<cmd>Telescope git_commits<cr>", "Commits" },
            b = { "<cmd>Telescope git_branches<cr>", "Branches" },
            s = { "<cmd>Telescope git_status<cr>", "Status" },
        },
    }

    wk.register(binds, { prefix = "<leader>" })
end

return M

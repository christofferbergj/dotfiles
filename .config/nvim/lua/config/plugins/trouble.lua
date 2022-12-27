return {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
        require("trouble").setup({
            auto_open = false,
            use_diagnostic_signs = true,
        })
    end,

    init = function()
        local wk = require("which-key")

        local leader_binds = {
            x = {
                x = { "<cmd>TroubleToggle<cr>", "Toggle" },
                t = { "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", "Todo Trouble" },
                T = { "<cmd>TodoTelescope<cr>", "Todo Telescope" },
                w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace" },
                d = { "<cmd>Trouble document_diagnostics<cr>", "Document" },
                l = { "<cmd>Trouble loclist<cr>", "Loclist" },
                q = { "<cmd>Trouble quickfix<cr>", "Quickfix" },
                r = { "<cmd>Trouble lsp_references<cr>", "References" },
            },
        }

        wk.register(leader_binds, { prefix = "<leader>" })
    end
}


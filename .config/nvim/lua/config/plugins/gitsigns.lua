local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  cond = not vim.g.vscode,
}

function M.config()
  require('gitsigns').setup {
    signs = {
      add = { hl = "GitSignsAdd", text = "▍", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      change = { hl = "GitSignsChange", text = "▍", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      delete = { hl = "GitSignsDelete", text = "", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      topdelete = { hl = "GitSignsDelete", text = "", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      changedelete = { hl = "GitSignsChange", text = "▍", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      untracked = { hl = "GitSignsAdd", text = "▍", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    },
    update_debounce = 15,
    on_attach = function()
      local bind = vim.keymap.set
      local gs = package.loaded.gitsigns
      local wk = require("which-key")

      local function handle_navigate_next()
        if vim.wo.diff then
          return "]h"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end

      local function handle_navigate_prev()
        if vim.wo.diff then
          return "[h"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end

      -- Navigation
      bind("n", "]h", handle_navigate_next, { expr = true, desc = "Next Hunk" })
      bind("n", "[h", handle_navigate_prev, { expr = true, desc = "Prev Hunk" })

      local leader_binds = {
        g = {
          h = {
            name = "Hunks",
            -- prev hunk
            ["["] = { "<cmd>lua require('gitsigns').prev_hunk()<cr>", "Prev Hunk" },
            -- next hunk
            ["]"] = { "<cmd>lua require('gitsigns').next_hunk()<cr>", "Next Hunk" },
            -- stage hunk
            s = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "Stage Hunk" },
            -- reset hunk
            r = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "Reset Hunk" },
            -- preview hunk
            p = { "<cmd>lua require('gitsigns').preview_hunk_inline()<cr>", "Preview Hunk" },
            -- blame line
            b = { "<cmd>lua require('gitsigns').blame_line()<cr>", "Blame Line" },
            -- diff diff
            d = { "<cmd>lua require('gitsigns').diffthis()<cr>", "Diff This" },
          }
        }
      }

      wk.register(leader_binds, { prefix = "<leader>" })

      -- Text object
      bind({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "GitSigns Select Hunk" })
    end,
  }
end

return M

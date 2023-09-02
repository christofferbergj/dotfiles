return {
  "andymass/vim-matchup",
  enabled = true,
  event = "BufRead",

  config = function()
    -- may set any options here
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
    vim.g.matchup_matchparen_enabled = 0
  end,

  init = function()
    -- Initialization space
  end,
}

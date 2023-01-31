local wezterm = require("wezterm")
local act = wezterm.action

return {
  leader = { key = "Space", mods = "SHIFT" },

  keys = {
    -- clears the scrollback and viewport leaving the prompt line the new first line.
    {
      key = 'r',
      mods = 'CMD',
      action = act.ClearScrollback 'ScrollbackAndViewport',
    },

    -- add new panes (match vim default)
    {
      key = "s",
      mods = "LEADER",
      action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "v",
      mods = "LEADER",
      action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "d",
      mods = "CMD",
      action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "d",
      mods = "CMD|SHIFT",
      action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
    },

    -- closes current pane
    {
      key = "w",
      mods = "CMD",
      action = act.CloseCurrentPane({ confirm = false }),
    },

    -- focus next pane
    {
      key = "k",
      mods = "CMD",
      action = act.ActivatePaneDirection 'Next'
    },

    -- focus previous pane
    {
      key = "j",
      mods = "CMD",
      action = act.ActivatePaneDirection 'Prev'
    },

    -- focus pane by number
    -- {
    --   key = "1",
    --   mods = "CMD",
    --   action = act.ActivatePaneByIndex(0),
    -- },
    -- {
    --   key = "2",
    --   mods = "CMD",
    --   action = act.ActivatePaneByIndex(1),
    -- },
    -- {
    --   key = "3",
    --   mods = "CMD",
    --   action = act.ActivatePaneByIndex(2),
    -- },
    --
    -- activate resize mode
    {
      key = "r",
      mods = "LEADER",
      action = act.ActivateKeyTable({
        name = "resize_pane",
        one_shot = false,
      }),
    },

    -- focus panes by direction
    {
      key = "h",
      mods = "LEADER",
      action = act.ActivatePaneDirection("Left"),
    },
    {
      key = "l",
      mods = "LEADER",
      action = act.ActivatePaneDirection("Right"),
    },
    {
      key = "k",
      mods = "LEADER",
      action = act.ActivatePaneDirection("Up"),
    },
    {
      key = "j",
      mods = "LEADER",
      action = act.ActivatePaneDirection("Down"),
    },

    -- focus panes by index
    { key = '1', mods = 'CTRL', action = act.ActivatePaneByIndex(0) },
    { key = '2', mods = 'CTRL', action = act.ActivatePaneByIndex(1) },
    { key = '3', mods = 'CTRL', action = act.ActivatePaneByIndex(2) },

    -- focus tab relative to each other
    {
      key = "j", mods = "CMD|SHIFT", action = act.ActivateTabRelative(-1)
    },
    {
      key = "k", mods = "CMD|SHIFT", action = act.ActivateTabRelative(1)
    },

    -- move tab relative to each other
    {
      key = 'h', mods = 'CMD|SHIFT', action = act.MoveTabRelative(-1)
    },
    {
      key = 'l', mods = 'CMD|SHIFT', action = act.MoveTabRelative(1)
    },
  },

  key_tables = {
    resize_pane = {
      { key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 5 }) },
      { key = "h", action = act.AdjustPaneSize({ "Left", 5 }) },

      { key = "RightArrow", action = act.AdjustPaneSize({ "Right", 5 }) },
      { key = "l", action = act.AdjustPaneSize({ "Right", 5 }) },

      { key = "UpArrow", action = act.AdjustPaneSize({ "Up", 2 }) },
      { key = "k", action = act.AdjustPaneSize({ "Up", 2 }) },

      { key = "DownArrow", action = act.AdjustPaneSize({ "Down", 2 }) },
      { key = "j", action = act.AdjustPaneSize({ "Down", 2 }) },

      { key = "Escape", action = "PopKeyTable" },
    },
  },
}

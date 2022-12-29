local wezterm = require("wezterm")
local mappings = require("modules.mappings")

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window)
  local name = window:active_key_table()
  if name then
    name = "TABLE: " .. name
  end
  window:set_right_status(name or "")
end)

return {
  -- general
  default_cursor_style = "SteadyBlock",
  color_scheme = "Gruvbox dark, medium (base16)",
  -- color_scheme = "Rosé Pine Moon (base16)",
  -- color_scheme = "tokyonight-storm",
  send_composed_key_when_left_alt_is_pressed = false,
  send_composed_key_when_right_alt_is_pressed = true,

  -- font
  font = wezterm.font("JetBrains Mono", { weight = "Medium" }),
  font_size = 15,
  line_height = 1.5,

  -- tab bar
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  tab_max_width = 999999,

  -- window
  window_background_opacity = 0.93,
  window_decorations = "RESIZE",
  window_padding = {
    left = 30,
    right = 30,
    top = 30,
    bottom = 30,
  },

  -- panes
  inactive_pane_hsb = {
    brightness = 0.75,
  },

  -- key bindings
  leader = mappings.leader,
  keys = mappings.keys,
  key_tables = mappings.key_tables,

  force_reverse_video_cursor = true,

  colors = {
    -- gruvbox tab_bar
    tab_bar = {
      -- The color of the strip that goes along the top of the window
      -- (does not apply when fancy tab bar is in use)
      background = "#282828",
      active_tab = {
        bg_color = "#32302f",
        fg_color = "#d5c4a1",
      },
      inactive_tab = {
        bg_color = "#282828",
        fg_color = "#a89984",
      },
      new_tab = {
        bg_color = "#282828",
        fg_color = "#a89984",
      },
    },
  },

  -- Kanagawa colors
  --colors = {
  --	foreground = "#dcd7ba",
  --	background = "#1f1f28",
  --
  --	cursor_bg = "#c8c093",
  --	cursor_fg = "#c8c093",
  --	cursor_border = "#c8c093",
  --
  --	selection_fg = "#c8c093",
  --	selection_bg = "#2d4f67",
  --
  --	scrollbar_thumb = "#16161d",
  --	split = "#16161d",
  --
  --	ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
  --	brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
  --	indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
  --
  --	tab_bar = {
  --		-- The color of the strip that goes along the top of the window
  --		-- (does not apply when fancy tab bar is in use)
  --		background = "#1f1f28",
  --		active_tab = {
  --			bg_color = "#2A2A37",
  --			fg_color = "#C8C093",
  --		},
  --		inactive_tab = {
  --			bg_color = "#1f1f28",
  --			fg_color = "#727169",
  --		},
  --		new_tab = {
  --			bg_color = "#1f1f28",
  --			fg_color = "#727169",
  --		},
  --	},
  --},
}

local wezterm = require("wezterm")
local mappings = require("modules.mappings")

local config = wezterm.config_builder()

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name
	end
	window:set_right_status(name or "")
end)

-- general
config.default_cursor_style = "SteadyBlock"
config.color_scheme = "Gruvbox dark, medium (base16)"
-- config.color_scheme = "Kanagawa (Gogh)"
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = true
config.window_close_confirmation = "NeverPrompt"
config.max_fps = 120

-- font
config.font = wezterm.font("JetBrainsMonoNL Nerd Font", { weight = "Medium" })
config.font_size = 15
config.line_height = 1.9

-- tab bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 999999

-- window frame and fancy tab bar
config.window_frame = {
	font_size = 14,
	font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Medium" }),
}

-- window
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 30,
	right = 30,
	top = 30,
	bottom = 30,
}

-- panes
config.inactive_pane_hsb = {
	brightness = 0.80,
}

-- key bindings
config.leader = mappings.leader
config.keys = mappings.keys
config.key_tables = mappings.key_tables

config.force_reverse_video_cursor = true

config.colors = {
	-- Gruvbox colors (does not apply when fancy tab bar is in use)
	tab_bar = {
		background = "#282828",
		active_tab = {
			bg_color = "#32302f",
			fg_color = "#d5c4a1",
			intensity = "Normal",
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

-- Kanagawa colors
	-- tab_bar = {
	-- 	background = "#1f1f28",
	-- 	active_tab = {
	-- 		bg_color = "#1f1f28",
	-- 		fg_color = "#dcd7ba",
	-- 		intensity = "Normal",
	-- 	},
	-- 	inactive_tab = {
	-- 		bg_color = "#1f1f28",
	-- 		fg_color = "#a89984",
	-- 	},
	-- 	new_tab = {
	-- 		bg_color = "#1f1f28",
	-- 		fg_color = "#a89984",
	-- 	},
	-- },
}

return config

local wezterm = require("wezterm")
local mappings = require("modules.mappings")
local act = wezterm.action

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, pane)
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

	--color_scheme = "Rosé Pine Moon (base16)",
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
		left = 25,
		right = 25,
		top = 25,
		bottom = 25,
	},

	-- panes
	inactive_pane_hsb = {
		brightness = 0.75,
	},

-- key bindings
	leader = mappings.leader,
	keys = mappings.keys,
	key_tables = mappings.key_tables,
}
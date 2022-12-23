local wezterm = require("wezterm")
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
	line_height = 1.4,

	-- tab bar
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = true,
	tab_max_width = 999999,

	-- window
	window_background_opacity = 0.95,
	window_decorations = "RESIZE",
	window_padding = {
		left = 30,
		right = 30,
		top = 30,
		bottom = 30,
	},


	-- panes
	inactive_pane_hsb = {
		brightness = 0.7,
	},

	keys = {
		-- Clears the scrollback and viewport leaving the prompt line the new first line.
		{
			key = 'r',
			mods = 'CMD',
			action = act.ClearScrollback 'ScrollbackAndViewport',
		},
	},
}

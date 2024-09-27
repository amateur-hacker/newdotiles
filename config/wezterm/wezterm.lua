local wezterm = require("wezterm")
local config = wezterm.config_builder()

config = {
	enable_wayland = true,
	color_scheme = "Catppuccin Mocha",
	font_size = 15,
	font = wezterm.font("JetBrains Mono Nerd Font", { weight = "DemiBold" }),

	-- font = wezterm.font_with_fallback({ "Operator Mono Lig", "JetBrains Mono Nerd Font" }),
	-- font = wezterm.font_with_fallback({ "JetBrains Mono Nerd Font", "Noto Color Emoji", "Symbols Nerd Font Mono" }),

	-- font = wezterm.font_with_fallback({
	-- 	{ family = "Operator Mono Lig", weight = "Regular", style = "Italic" },
	-- 	"JetBrains Mono Nerd Font",
	-- 	"Noto Color Emoji",
	-- }),

	window_background_opacity = 1,
	window_close_confirmation = "NeverPrompt",
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	show_new_tab_button_in_tab_bar = false,
	audible_bell = "Disabled",
	default_cursor_style = "SteadyUnderline",
	keys = {
		{ key = "T", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
		{ key = "W", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
		{ key = "Tab", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
		{ key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },

		{ key = "j", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
		{ key = "k", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
		{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
		{ key = "l", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(1) },
	},
}

return config
